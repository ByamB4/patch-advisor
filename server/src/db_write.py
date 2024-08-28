from prisma import Prisma, Client
from datetime import datetime
from dotenv import load_dotenv
from json import load as json_load
from configs import *


class DB_actor:
    def __init__(self, db: Client) -> None:
        self.db = db
        self.microsoft()
        self.hackernews()

    def microsoft(self) -> None:
        with open(f"{STATIC_ROOT}/microsoft.json", "r") as f:
            items = json_load(f)
        for it in items:
            date_obj = datetime.strptime(it["release_date"], "%b %d, %Y")
            existing_entry = self.db.microsoft.find_first(where={"cve": it["cve"]})
            if existing_entry:
                continue
            self.db.microsoft.create(
                data={
                    "revision_date": it["revision_date"],
                    "cve": it["cve"],
                    "cve_link": it["cve_link"],
                    "cve_title": it["cve_title"],
                    "impact": it["impact"],
                    "severity": it["severity"],
                    "tag": it["tag"],
                    "release_date": date_obj,
                },
            )

        print("[microsoft@save] done")

    def hackernews(self) -> None:
        with open(f"{STATIC_ROOT}/hackernews.json", "r") as f:
            items = json_load(f)
        for it in items:
            date_obj = datetime.strptime(it["date"], "%b %d, %Y")
            existing_entry = self.db.hackernews.find_first(
                where={
                    "title": it["title"],
                }
            )
            if existing_entry:
                continue
            self.db.hackernews.create(
                data={
                    "link": it["link"],
                    "img": it["img"],
                    "title": it["title"],
                    "date": date_obj,
                    "description": it["description"],
                    "category": it["category"],
                    "page_content": it["page_content"],
                    "author": it["author"],
                },
            )
        print("[hackernews@save] done")


def main() -> None:
    load_dotenv()
    db = Prisma()
    db.connect()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    DB_actor(db)
    db.disconnect()


if __name__ == "__main__":
    main()
