## Build docker

```sh
docker build -t patch-python -f Dockerfile .
docker run --rm -v $(pwd)/server:/home -e PYTHONBUFFERED=1 patch-python python3
/home/redhat.py
```
