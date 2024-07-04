from playwright.sync_api import sync_playwright, ElementHandle
from playwright_stealth import stealth_sync
from typing import List
from time import sleep
from datetime import datetime
from dotenv import load_dotenv
from prisma import Prisma, Client


class Microsoft:
    NEW_ITEMS: List[dict] = []
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self, db: Client) -> any:
        with sync_playwright() as p:
            self.db = db
            self.browser = p.chromium.launch(headless=True, args=["--start-maximized"])
            self.context = self.browser.new_context(no_viewport=True)
            self._1_tab = self.context.new_page()
            stealth_sync(self._1_tab)
            self.scrape()
            self.write_to_db()
            self._1_tab.close()
            self.context.close()

    def scrape(self) -> bool:
        self._1_tab.goto("https://msrc.microsoft.com/update-guide/vulnerability")
        self._1_tab.wait_for_load_state("networkidle")
        for root_group_tab in self._1_tab.query_selector_all("xpath=//div[@role='presentation' and @class='ms-List-surface']/div"):
            for row in root_group_tab.query_selector_all("xpath=./div"):
                release_date = row.wait_for_selector("xpath=.//div[@data-automation-key='releaseDate']").text_content()
                revision_date = row.wait_for_selector("xpath=.//div[@data-automation-key='latestRevisionDate']").text_content()
                cve = row.wait_for_selector("xpath=.//div[@data-automation-key='cveNumber']/a").text_content()
                cve_link = row.wait_for_selector("xpath=.//div[@data-automation-key='cveNumber']/a").get_attribute("href")
                cve_title = row.wait_for_selector("xpath=.//div[@data-automation-key='cveTitle']").text_content()
                impact = row.wait_for_selector("xpath=.//div[@data-automation-key='impact']").text_content()
                severity = row.wait_for_selector("xpath=.//div[@data-automation-key='severity']").text_content()
                tag = row.wait_for_selector("xpath=.//div[@data-automation-key='tag']").text_content()
                self.NEW_ITEMS.append({"release_date": release_date, "revision_date": revision_date, "cve": cve, "cve_link": cve_link, "cve_title": cve_title, "impact": impact, "severity": severity, "tag": tag})

        print(f"[microsoft@scrape] {len(self.NEW_ITEMS)}", flush=True)
        return True

    def write_to_db(self) -> bool:
        self.db.microsoft.create_many(data=self.NEW_ITEMS, skip_duplicates=True)
        print(f"[redhat@save] done", flush=True)
        return True


def main():
    db = Prisma()
    db.connect()
    load_dotenv()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    Microsoft(db)
    db.disconnect()


if __name__ == "__main__":
    main()
