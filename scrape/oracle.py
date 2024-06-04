from playwright.sync_api import sync_playwright
from configs import STATIC_ROOT
from json import dump as json_dump, load as json_load
from os import path
from typing import List


class OracleAdvisor:
    URL: str = "https://www.oracle.com"
    NEW_ITEMS: List[dict] = []
    DATA: List[dict] = []

    def __init__(self) -> None:
        p = sync_playwright().start()
        self.browser = p.chromium.launch(headless=True)
        self.context = self.browser.new_context(no_viewport=True)
        self.page = self.context.new_page()
        self.read_data()
        self.check_new_update()
        self.save()
        self.page.close()
        self.context.close()

    def read_data(self) -> bool:
        try:
            with open(path.join(STATIC_ROOT, "oracle.json"), "r") as f:
                self.DATA = json_load(f)
            return True
        except Exception as e:
            print("[oracle@read_data]", e)
            return False

    def check_new_update(self) -> bool:
        print(f"[oracle@check_new_update] starting...")
        self.page.goto(f"{self.URL}/security-alerts")
        self.page.wait_for_selector("xpath=//div[@data-ocomid='otable']")
        new_url: str = self.page.query_selector("xpath=//div[@data-ocomid='otable']//table[@class='otable-tech-basic otable-w2 otable-scroll']/tbody/tr/td/a").get_attribute("href")
        self.page.goto(f"{self.URL}{new_url}")
        self.page.wait_for_selector("xpath=//div[@data-ocomid='otable']")
        for tr in self.page.query_selector_all("xpath=//div[@data-ocomid='otable'][1]//table[@class='otable-tech-basic otable-w2']/tbody//tr"):
            a, b = tr.query_selector_all("xpath=./td")
            if not a.text_content() in [_["affected_product"] for _ in self.DATA]:
                print(f"[oracle@new]", b.query_selector("xpath=./a").get_attribute("href"))
                self.NEW_ITEMS.append(
                    {
                        "affected_product": a.text_content(),
                        "affected_product_link": f'{self.URL}{new_url}{a.query_selector("xpath=./a").get_attribute("href")}',
                        "patch_document": b.text_content(),
                        "patch_document_link": b.query_selector("xpath=./a").get_attribute("href"),
                    }
                )

    def save(self) -> bool:
        with open(path.join(STATIC_ROOT, "oracle.json"), "w") as f:
            json_dump(self.NEW_ITEMS + self.DATA, f, indent=2)
        print(f"[oracle@save] done")
        return True


if __name__ == "__main__":
    OracleAdvisor()
