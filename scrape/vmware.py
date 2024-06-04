from playwright.sync_api import sync_playwright
from configs import STATIC_ROOT
from json import dump as json_dump, load as json_load
from os import path
from typing import List


class VMwareAdvisor:
    DATA: List[dict] = []
    TMP: List[dict] = []
    NEW_ITEMS: List[dict] = []
    URL: str = "https://www.vmware.com/security/advisories.html"

    def __init__(self) -> None:
        p = sync_playwright().start()
        self.browser = p.chromium.launch(headless=True)
        self.context = self.browser.new_context(no_viewport=True)
        self.page = self.context.new_page()
        self.read_data()
        self.scrape()
        self.save()
        self.page.close()
        self.context.close()

    def read_data(self) -> bool:
        try:
            with open(path.join(STATIC_ROOT, "vmware.json"), "r") as f:
                self.DATA = json_load(f)
            return True
        except Exception as e:
            print(f"[vmware@read_data]", e)
            return False

    def scrape(self) -> bool:
        self.page.goto(self.URL)
        self.page.wait_for_selector("xpath=//tbody[@style='display: table-row-group;']", timeout=60_000)
        for row in self.page.wait_for_selector("xpath=//table[@id='table_id']").query_selector_all("xpath=.//tbody//tr"):
            header, _date = {}, {}
            raw_link = row.query_selector("xpath=.//td[@class=' details-control']/a")
            header["link"], header["cve"] = (
                "https://vmware.com" + raw_link.get_attribute("href"),
                raw_link.text_content().replace(" ", ""),
            )
            print("[vmware@cve]", header["cve"])
            header["severity"] = row.query_selector("xpath=.//td[@class=' severity-block']").text_content()
            header["synopsis"] = row.query_selector("xpath=.//td[@class=' synopsis-block hideColumn']").text_content()
            header["updated_on"] = row.query_selector("xpath=.//td[@class=' updatedDate-block hideColumn']").text_content()
            if not header["cve"] in [_["cve"] for _ in self.DATA]:
                self.fetch_detail(header)
                self.NEW_ITEMS.append(header["cve"])

        return True

    def fetch_detail(self, header: dict) -> bool:
        self.context.new_page()
        self.context.pages[1].goto(header["link"])
        root_content = self.context.pages[1].wait_for_selector("xpath=//div[@role='main']//div[@class='responsivegrid aem-GridColumn aem-GridColumn--default--12 breadcrumb-theme']//div[@class='aem-Grid aem-Grid--12 aem-Grid--default--12 ']")
        self.TMP.append(
            {
                "cve": header["cve"],
                "synopsis": header["synopsis"],
                "severity": header["severity"],
                "date": header["updated_on"],
                "link": header["link"],
                "detail": root_content.inner_html(),
            }
        )
        self.context.pages[1].close()

    def save(self) -> bool:
        print("[vmware@new_items]", self.NEW_ITEMS)
        with open(path.join(STATIC_ROOT, "vmware.json"), "w") as f:
            json_dump(self.TMP + self.DATA, f, indent=2)
        print(f"[vmware@save] done")
        return True


if __name__ == "__main__":
    VMwareAdvisor()
