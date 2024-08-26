from playwright.sync_api import sync_playwright
from playwright_stealth import stealth_sync
from configs import *
from json import dump as json_dump
from datetime import datetime
from time import sleep
from typing import List


class HackerNews:
    NEW_ITEMS: List[dict] = []
    DATA: List[dict] = []
    RETRY_ATTEMPT: int = 3
    RETRY_DELAY: int = 2

    def __init__(self) -> None:
        with sync_playwright() as p:
            self.browser = p.chromium.launch(headless=True)
            self.context = self.browser.new_context(no_viewport=True)
            self.page = self.context.new_page()
            stealth_sync(self.page)
            self.scrape_data()
            self.save_to_json()
            self.page.close()
            self.context.close()

    def save_to_json(self) -> bool:
        file_path = "/home/static/hackernews.json"
        if DEBUG:
            file_path = f"{STATIC_ROOT}/hackernews.json"

        with open(file_path, "w", encoding="utf-8") as f:
            json_dump(self.NEW_ITEMS, f, indent=2, ensure_ascii=False)
        print("[hackernews@save] done", flush=True)
        return True

    def scrape_data(self) -> None:
        print("[hackernews@scrape_data] starting...", flush=True)
        for attempt in range(1, self.RETRY_ATTEMPT + 1):
            try:
                self.page.goto("https://thehackernews.com")
                for content in self.page.query_selector_all("//div[@id='content']//div[@class='blog-posts clear']/div"):
                    link = content.wait_for_selector("xpath=./a").get_attribute("href")
                    img = content.wait_for_selector("xpath=.//div[@class='img-ratio']").inner_html().split('src="')[1].split('"')[0]
                    title = content.wait_for_selector("xpath=.//h2[@class='home-title']").text_content()
                    date = content.wait_for_selector("xpath=.//span[@class='h-datetime']").inner_html().split("/i>")[-1]
                    category = content.wait_for_selector("xpath=.//span[@class='h-tags']").inner_html()
                    description = content.wait_for_selector("xpath=.//div[@class='home-desc']").text_content()
                    print("[title]", title, flush=True)
                    page_content, author = self.fetch_detail(link)
                    self.NEW_ITEMS.append({"link": link, "img": img, "title": title, "date": date, "description": description, "category": category, "page_content": page_content, "author": author})
                    print("=" * 50, flush=True)
            except Exception as e:
                print(f"[hackernews@attempt] {attempt} failed", flush=True)
                sleep(self.RETRY_DELAY)

    def fetch_detail(self, url: str) -> None:
        self.page_2 = self.context.new_page()
        stealth_sync(self.page_2)
        self.page_2.goto(url)
        page_content = self.page_2.wait_for_selector("xpath=//div[@id='articlebody']").inner_html()
        author = self.page_2.query_selector_all("//span[@class='author']")[1].inner_text()
        self.page_2.close()
        return page_content, author


def main() -> None:
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    HackerNews()


if __name__ == "__main__":
    main()
