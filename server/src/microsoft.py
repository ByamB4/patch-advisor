from playwright.sync_api import sync_playwright
from playwright_stealth import stealth_sync
from typing import List
from time import sleep
from json import dump as json_dump
from configs import *
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()


file_path = "/home/static/microsoft.json"
if DEBUG:
    file_path = f"{STATIC_ROOT}/microsoft.json"


class Microsoft:
    NEW_ITEMS: List[dict] = []
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self) -> any:
        with sync_playwright() as p:
            self.browser = p.chromium.launch(headless=True, args=["--start-maximized"])
            self.context = self.browser.new_context(no_viewport=True)
            self.page = self.context.new_page()
            stealth_sync(self.page)
            self.create_file()
            self.scrape()
            self.save_to_json()
            self.page.close()
            self.context.close()

    def create_file(self) -> bool:
        with open(file_path, "w", encoding="utf-8") as f:
            json_dump([], f, indent=2, ensure_ascii=False)
        print("[microsoft@create_file] done", flush=True)
        return True

    def scrape(self) -> bool:
        print("[microsoft@scrape] starting ...", flush=True)
        for attempt in (1, self.RETRY_ATTEMPT + 1):
            try:
                self.page.goto("https://msrc.microsoft.com/update-guide/vulnerability")
                self.page.wait_for_load_state("networkidle")
                for root_group_tab in self.page.query_selector_all("xpath=//div[@role='presentation' and @class='ms-List-surface']/div"):
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
                        print(f"[{cve}] {cve_title}", flush=True)
                        print("=" * 50, flush=True)

                print(f"[microsoft@scrape] {len(self.NEW_ITEMS)}", flush=True)
                return True
            except Exception as e:
                print(f"[microsoft@attempt] {attempt} failed", flush=True)
                sleep(self.RETRY_DELAY)

    def save_to_json(self) -> bool:
        with open(file_path, "w", encoding="utf-8") as f:
            json_dump(self.NEW_ITEMS, f, indent=2, ensure_ascii=False)
        print("[microsoft@save_to_json] done", flush=True)
        return True


def main():
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    Microsoft()


if __name__ == "__main__":
    main()
