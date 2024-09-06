from os import getenv, path
from dotenv import load_dotenv

load_dotenv()

PROJECT_NAME = "khanbank-patch-advisor"
DEBUG = True


def get_project_root() -> str:
    cwd = path.dirname(path.abspath(__file__))
    return cwd[: cwd.find(PROJECT_NAME) + len(PROJECT_NAME)]


PROJECT_ROOT = get_project_root()
STATIC_ROOT = path.join(PROJECT_ROOT, "server", "static")
