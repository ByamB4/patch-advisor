from prisma import Prisma, Client
from datetime import datetime
from dotenv import load_dotenv
from os import getenv
from json import load as json_load
from configs import *


class MicrosoftDB:
    def __init__(self, db: Client) -> None:
        self.db = db
        self.write_db()

    def write_db(self) -> None:
        with open(f"{STATIC_ROOT}/microsoft.json", "r") as f:
            items = json_load(f)
            self.db.microsoft.create_many(data=items, skip_duplicates=True)


def main() -> None:
    load_dotenv()
    db = Prisma()
    db.connect()
    formatted_time = datetime.now().strftime("%Y-%m-%d %H:%M")
    print("[current_time]", formatted_time, flush=True)
    MicrosoftDB(db)
    db.disconnect()


if __name__ == "__main__":
    main()
