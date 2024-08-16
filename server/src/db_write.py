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
            self.db.microsoft.create_many(data=items, skip_duplicates=True)

    def hackernews(self) -> None:
        with open(f"{STATIC_ROOT}/hackernews.json", "r") as f:
            items = json_load(f)
            self.db.hackernews.create_many(data=items, skip_duplicates=True)


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
