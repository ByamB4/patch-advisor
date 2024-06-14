from playwright.sync_api import sync_playwright
from playwright_stealth import stealth_sync
from configs import STATIC_ROOT
from json import dump as json_dump, load as json_load
from time import sleep
from os import path
from typing import List


class CiscoSecurityAdvisor:
    TMP: List[dict] = []
    DATA: List[dict] = []
    NEW_ITEMS: List[dict] = []
    URL: str = "https://sec.cloudapps.cisco.com/security/center"
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self) -> None:
        p = sync_playwright().start()
        self.browser = p.chromium.launch(headless=True)
        self.context = self.browser.new_context(no_viewport=True)
        self.page = self.context.new_page()
        stealth_sync(self.page)
        self.read_data()
        self.scrape()
        self.save()
        self.page.close()
        self.context.close()

    def read_data(self) -> bool:
        try:
            with open(path.join(STATIC_ROOT, "cisco.json"), "r") as f:
                self.DATA = json_load(f)
            return True
        except Exception as e:
            print(f"[cisco@read_data]", e, flush=True)
            return False

    def scrape(self) -> bool:
        print(f"[cisco@scrape] starting...", flush=True)
        for attempt in range(1, self.RETRY_ATTEMPT + 1):
            print(f"[cisco@attempt] {attempt}", flush=True)
            try:
                self.page.goto(
                    f"{self.URL}/publicationListing.x?product=Cisco&sort=-day_sir&limit=100#~Vulnerabilities"
                )
                self.page.wait_for_selector(
                    "xpath=//table[@class='advisoryAlertTable']//table"
                )
                for row in self.page.wait_for_selector(
                    "xpath=//table[@class='advisoryAlertTable']"
                ).query_selector_all("xpath=.//tr[@ng-repeat='list in advisoryList']"):
                    header = {}
                    header["link"] = row.query_selector(
                        "xpath=.//span[@class='advListItem']/a"
                    ).get_attribute("href")
                    header["title"] = row.query_selector(
                        "xpath=.//span[@class='advListItem']/a"
                    ).text_content()
                    header["impact"] = row.query_selector(
                        "xpath=.//td[@class='impactTD']//span[@class='ng-binding']"
                    ).text_content()
                    header["id"] = header["link"].split("/")[-1]
                    header["version"] = row.query_selector(
                        "xpath=.//span[@class='ng-binding ng-scope']"
                    ).text_content()
                    header["last_updated"] = row.query_selector(
                        "xpath=//td[@width='15%']/span[@class='ng-binding']"
                    ).text_content()
                    if header["impact"] == "Informational":
                        continue
                    header["raw_cves"] = (
                        row.query_selector(
                            "xpath=.//td[@style='position:relative;']/p/span"
                        )
                        .text_content()
                        .split()
                    )
                    if len(header["raw_cves"]) > 2:
                        clean_cves = header["raw_cves"][:2] + header["raw_cves"][
                            3
                        ].split(",")
                    else:
                        clean_cves = header["raw_cves"]
                    print("[cisco@id]", header["id"], flush=True)
                    if not header["id"] in [_["id"] for _ in self.DATA]:
                        self.NEW_ITEMS.append(header["id"])
                        self.TMP.append(
                            {
                                "id": header["id"],
                                "link": header["link"],
                                "title": header["title"],
                                "impact": header["impact"],
                                "version": header["version"],
                                "last_updated": header["last_updated"],
                                "clean_cves": clean_cves,
                            }
                        )
                    # self.fetch_detail(link, clean_cves)
            except Exception as e:
                print(f"[cisco@attempt] failed", flush=True)
                sleep(self.RETRY_DELAY)

    def save(self) -> bool:
        print("[cisco@new_items]", self.NEW_ITEMS, flush=True)
        with open(path.join(STATIC_ROOT, "cisco.json"), "w") as f:
            json_dump(self.TMP + self.DATA, f, indent=2)
        print("[cisco@save] done", flush=True)
        return True

    def fetch_detail(self, url: str, cves: str) -> None:
        self.context.new_page()
        self.context.pages[1].goto(url)
        container = self.context.pages[1].wait_for_selector(
            "xpath=//div[@id='ud-master-container']"
        )
        title = container.query_selector("xpath=.//h1[@class='headline']")
        first_published = container.query_selector(
            "xpath=.//div[@id='ud-published']//div[@class='divLabelContent']"
        ).text_content()
        # print("\t[final_title]", title)
        summary = container.query_selector("xpath=.//div[@id='summaryfield']")
        affected_products = container.query_selector(
            "xpath=.//div[@id='affectfield']//div[@class='ud-subsectionindent']"
        )
        print(summary.inner_html(), flush=True)
        print(affected_products.inner_html(), flush=True)
        self.context.pages[1].close()


if __name__ == "__main__":
    CiscoSecurityAdvisor()
