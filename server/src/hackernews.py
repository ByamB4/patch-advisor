from playwright.sync_api import sync_playwright
from playwright_stealth import stealth_sync
from configs import STATIC_ROOT
from json import dump as json_dump, load as json_load
from datetime import datetime
from time import sleep
from os import path
from typing import List


class HackerNews:
    NEW_ITEMS: List[dict] = []
    DATA: List[dict] = []
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self) -> None:
        with sync_playwright() as p:
            self.browser = p.chromium.launch(headless=True, channel="chrome")
            self.context = self.browser.new_context(no_viewport=True)
            self.page = self.context.new_page()
            stealth_sync(self.page)
            self.scrape_data()
            self.save_to_json()
            self.page.close()
            self.context.close()

    def save_to_json(self) -> bool:
        with open(path.join(STATIC_ROOT, "hackernews.json"), "w", encoding="utf-8") as f:
            json_dump(self.NEW_ITEMS, f, indent=2, ensure_ascii=False)
        print("[hackernews@save] done", flush=True)
        return True

    def scrape_data(self) -> None:
        self.page.goto("https://thehackernews.com")
        for content in self.page.query_selector_all("//div[@id='content']//div[@class='blog-posts clear']/div"):
            link = content.wait_for_selector("xpath=./a").get_attribute("href")
            img = content.wait_for_selector("xpath=.//div[@class='img-ratio']").inner_html().split('src="')[1].split('"')[0]
            title = content.wait_for_selector("xpath=.//h2[@class='home-title']").text_content()
            date = content.wait_for_selector("xpath=.//span[@class='h-datetime']").inner_html().split("/i>")[-1]
            category = content.wait_for_selector("xpath=.//span[@class='h-tags']").inner_html()
            description = content.wait_for_selector("xpath=.//div[@class='home-desc']").text_content()
            print("[title]", title)
            page_content, author = self.fetch_detail(link)
            self.NEW_ITEMS.append({"link": link, "img": img, "title": title, "date": date, "description": description, "category": category, "page_content": page_content, "author": author})
            print("=" * 50)

    def fetch_detail(self, url: str) -> None:
        self.page_2 = self.context.new_page()
        stealth_sync(self.page_2)
        self.page_2.goto(url)

        page_content = self.page_2.wait_for_selector("xpath=//div[@id='articlebody']").inner_html()
        author = self.page_2.query_selector_all("//span[@class='author']")[1].inner_text()
        self.page_2.close()
        return page_content, author

    def read_data(self) -> bool:
        try:
            with open(path.join(STATIC_ROOT, "oracle.json"), "r") as f:
                self.DATA = json_load(f)
            return True
        except Exception as e:
            print("[oracle@read_data]", e, flush=True)
            return False

    def check_new_update(self) -> bool:
        print(f"[oracle@check_new_update] starting...", flush=True)
        for attempt in range(1, self.RETRY_ATTEMPT + 1):
            print(f"[oracle@attempt] {attempt}", flush=True)
            try:
                self.page.goto(f"{self.URL}/security-alerts")
                self.page.wait_for_selector("xpath=//div[@data-ocomid='otable']")
                new_url: str = self.page.query_selector("xpath=//div[@data-ocomid='otable']//table[@class='otable-tech-basic otable-w2 otable-scroll']/tbody/tr/td/a").get_attribute("href")
                self.page.goto(f"{self.URL}{new_url}")
                self.page.wait_for_selector("xpath=//div[@data-ocomid='otable']")
                for tr in self.page.query_selector_all("xpath=//div[@data-ocomid='otable'][1]//table[@class='otable-tech-basic otable-w2']/tbody//tr"):
                    a, b = tr.query_selector_all("xpath=./td")
                    if not a.text_content() in [_["affected_product"] for _ in self.DATA]:
                        print(
                            f"[oracle@new]",
                            b.query_selector("xpath=./a").get_attribute("href"),
                            flush=True,
                        )
                        self.NEW_ITEMS.append(
                            {
                                "affected_product": a.text_content(),
                                "affected_product_link": f'{self.URL}{new_url}{a.query_selector("xpath=./a").get_attribute("href")}',
                                "patch_document": b.text_content(),
                                "patch_document_link": b.query_selector("xpath=./a").get_attribute("href"),
                            }
                        )
                return True
            except Exception as e:
                print(f"[oracle@attempt] failed", flush=True)
                sleep(self.RETRY_DELAY)
        return False

    def save(self) -> bool:
        with open(path.join(STATIC_ROOT, "oracle.json"), "w") as f:
            json_dump(self.NEW_ITEMS + self.DATA, f, indent=2)
        print(f"[oracle@save] done", flush=True)
        return True


def main() -> None:
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    HackerNews()


if __name__ == "__main__":
    main()
