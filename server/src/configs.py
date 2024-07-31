from os import getenv, path

# windows
PROJECT_NAME = path.dirname(path.abspath(__file__)).split("\\")[-1]
DEBUG = True


def get_project_root() -> str:
    cwd = path.dirname(path.abspath(__file__))
    return cwd[: cwd.find(PROJECT_NAME) + len(PROJECT_NAME)]


PROJECT_ROOT = get_project_root()
STATIC_ROOT = path.join(PROJECT_ROOT, "static")
