## Build docker

```sh
docker build -t patch-scraper -f Dockerfile .
docker run --rm -v $(pwd)/scrape:/home -e PYTHONBUFFERED=1 ubuntu-scrape python3
/home/redhat.py
```

