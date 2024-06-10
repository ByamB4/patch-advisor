docker volume create scrape-data
docker build -t ubuntu -f Dockerfile .

# method 1: single command
  docker run --rm -v $(pwd)/scrape:/home -e PYTHONBUFFERED=1 ubuntu python3 /home/redhat.py

# method 2: inside box
  docker run --rm -it -v $(pwd)/scrape:/home ubuntu /bin/bash

