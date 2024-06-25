from playwright.sync_api import sync_playwright, ElementHandle
from playwright_stealth import stealth_sync
from typing import List
from time import sleep
from datetime import datetime
from dotenv import load_dotenv
from prisma import Prisma, Client


class RedhatErrata:
    DATA: List[dict] = []
    TMP: List[dict] = []
    NEW_ITEMS: List[dict] = []
    URL: str = "https://access.redhat.com/errata-search/?q=&p=1&sort=portal_publication_date+desc&rows=100"
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self, db: Client) -> any:
        with sync_playwright() as p:
            self.db = db
            self.browser = p.chromium.launch(headless=True, args=["--start-maximized"])
            self.context = self.browser.new_context(no_viewport=True)
            self._1_tab = self.context.new_page()
            stealth_sync(self._1_tab)
            self.check_new_update()
            self.scrape()
            self.write_to_db()
            self._1_tab.close()
            self.context.close()

    def check_new_update(self) -> bool:
        print(f"[redhat@check_new_update] starting...", flush=True)
        for attempt in range(1, self.RETRY_ATTEMPT + 1):
            print(f"[redhat@attempt] {attempt}", flush=True)
            try:
                self._1_tab.goto(self.URL, wait_until="networkidle")
                self._1_tab.wait_for_selector("//table[@id='Security-Errata-Table']//tbody//tr")
                for row in self._1_tab.query_selector_all("xpath=//table[@id='Security-Errata-Table']//tbody//tr"):
                    header = {}
                    header["element"] = row.query_selector("xpath=./th[@headers='th-errata']")
                    header["cve"] = header["element"].query_selector("xpath=.//a").text_content()
                    if not self.db.redhat.find_unique({"cve": header["cve"]}):
                        self.NEW_ITEMS.append(header["cve"])
                print(f"[redhat@check_new_update]", self.NEW_ITEMS, flush=True)
                break
            except Exception as e:
                print(f"[redhat@attempt] failed", flush=True)
                sleep(self.RETRY_DELAY)

    def query_inner(self, source: ElementHandle, query: str) -> List[str]:
        return [el.inner_html() for el in source.query_selector_all(f"xpath={query}")]

    def scrape(self) -> bool:
        table = self._1_tab.wait_for_selector("xpath=//table[@id='Security-Errata-Table']")
        for row in table.query_selector_all("xpath=.//tbody//tr"):
            header, _date = {}, {}
            header["element"] = row.query_selector("xpath=./th[@headers='th-errata']")
            header["link"] = header["element"].query_selector("xpath=.//a").get_attribute("href")
            header["cve"] = header["element"].query_selector("xpath=.//a").text_content()
            _date["element"] = row.query_selector("xpath=./td[@id='errataItem--date']")
            _date["date"] = _date["element"].query_selector("xpath=.//span").text_content()
            if header["cve"] in self.NEW_ITEMS:
                self.fetch_detail(header, _date)

        print("[redhat@scrape] done", flush=True)
        return True

    def fetch_detail(self, header: dict, _date: List[dict]) -> bool:
        self.context.new_page()
        _2_tab = self.context.pages[1]
        stealth_sync(_2_tab)
        _2_tab.goto(header["link"], wait_until="networkidle")
        if len(_2_tab.title()) == 0:
            return False
        tab_content = _2_tab.wait_for_selector("xpath=//div[@class='tab-content']")
        synopsis = tab_content.query_selector("xpath=.//div[@id='synpopsis']//p").text_content()
        severity = tab_content.query_selector("xpath=.//div[@id='type-severity']//p").text_content()
        topics = self.query_inner(tab_content, ".//div[@id='topic']//p")
        description = tab_content.query_selector("xpath=.//div[@id='description']").inner_html()
        solution = tab_content.query_selector("xpath=.//div[@id='solution']").inner_html()
        affected_products = tab_content.query_selector("xpath=.//div[@id='affected_products']").inner_html()
        fixes = tab_content.query_selector("xpath=.//div[@id='fixes']").inner_html()
        cves = tab_content.query_selector("xpath=.//div[@id='cves']").inner_html()
        references = tab_content.query_selector("xpath=.//div[@id='references']").inner_html()
        self.TMP.append(
            {
                "cve": header["cve"],
                "synopsis": synopsis,
                "severity": severity,
                "topics": topics,
                "description": description,
                "solution": solution,
                "affected_products": affected_products,
                "fixes": fixes,
                "cves": cves,
                "references": references,
                "date": _date["date"],
            }
        )
        _2_tab.close()
        return True

    def write_to_db(self) -> bool:
        self.db.redhat.create_many(data=self.TMP, skip_duplicates=True)
        print(f"[redhat@save] done", flush=True)
        return True


def main():
    db = Prisma()
    db.connect()
    load_dotenv()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    RedhatErrata(db)
    db.disconnect()


if __name__ == "__main__":
    main()
