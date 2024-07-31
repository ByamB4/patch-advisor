from playwright.sync_api import sync_playwright
from playwright_stealth import stealth_sync
from scrape.src.configs import STATIC_ROOT
from json import dump as json_dump, load as json_load
from time import sleep
from datetime import datetime
from os import path
from typing import List
from prisma import Prisma, Client


class CiscoSecurityAdvisor:
    TMP: List[dict] = []
    DATA: List[dict] = []
    NEW_ITEMS: List[dict] = []
    URL: str = "https://sec.cloudapps.cisco.com/security/center"
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self, db: Client) -> None:
        with sync_playwright() as p:
            self.db = db
            self.browser = p.chromium.launch(headless=True)
            self.context = self.browser.new_context(no_viewport=True)
            self._1_tab = self.context.new_page()
            stealth_sync(self._1_tab)
            self.scrape()
            self.save()
            self.write_to_db()
            self._1_tab.close()
            self.context.close()

    def scrape(self) -> bool:
        print(f"[cisco@scrape] starting...", flush=True)
        for attempt in range(1, self.RETRY_ATTEMPT + 1):
            print(f"[cisco@attempt] {attempt}", flush=True)
            try:
                self._1_tab.goto(f"{self.URL}/publicationListing.x?product=Cisco&sort=-day_sir&limit=100#~Vulnerabilities")
                self._1_tab.wait_for_selector("xpath=//table[@class='advisoryAlertTable']//table")
                for row in self._1_tab.wait_for_selector("xpath=//table[@class='advisoryAlertTable']").query_selector_all("xpath=.//tr[@ng-repeat='list in advisoryList']"):
                    header = {}
                    header["link"] = row.query_selector("xpath=.//span[@class='advListItem']/a").get_attribute("href")
                    header["title"] = row.query_selector("xpath=.//span[@class='advListItem']/a").text_content()
                    header["impact"] = row.query_selector("xpath=.//td[@class='impactTD']//span[@class='ng-binding']").text_content()
                    header["id"] = header["link"].split("/")[-1]
                    header["version"] = row.query_selector("xpath=.//span[@class='ng-binding ng-scope']").text_content()
                    header["last_updated"] = row.query_selector("xpath=//td[@width='15%']/span[@class='ng-binding']").text_content()
                    if header["impact"] == "Informational":
                        continue
                    header["raw_cves"] = row.query_selector("xpath=.//td[@style='position:relative;']/p/span").text_content().split()
                    if len(header["raw_cves"]) > 2:
                        clean_cves = header["raw_cves"][:2] + header["raw_cves"][3].split(",")
                    else:
                        clean_cves = header["raw_cves"]
                    print("[cisco@id]", header["id"], flush=True)
                    if not self.db.cisco.find_unique({"id": header["id"]}):
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

    def fetch_detail(self, url: str, cves: str) -> None:
        self.context.new_page()
        _2_tab = self.context.pages
        _2_tab.goto(url)
        container = _2_tab.wait_for_selector("xpath=//div[@id='ud-master-container']")
        title = container.query_selector("xpath=.//h1[@class='headline']")
        first_published = container.query_selector("xpath=.//div[@id='ud-published']//div[@class='divLabelContent']").text_content()
        # print("\t[final_title]", title)
        summary = container.query_selector("xpath=.//div[@id='summaryfield']")
        affected_products = container.query_selector("xpath=.//div[@id='affectfield']//div[@class='ud-subsectionindent']")
        print(summary.inner_html(), flush=True)
        print(affected_products.inner_html(), flush=True)
        _2_tab.close()

    def write_to_db(self) -> None:
        pass


def main():
    db = Prisma()
    db.connect()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    CiscoSecurityAdvisor(db)
    db.disconnect()


if __name__ == "__main__":
    main()
