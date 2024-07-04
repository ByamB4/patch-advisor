#!/bin/bash

source .env

if [[ $DEBUG == "1" ]]; then
  # development
  DATA_DIR="/Users/byamb4/dev/patch-advisor";
else
  # production
  DATA_DIR="/root/patch-advisor"
fi

NAME='vmware';

docker run --rm \
  -v "$DATA_DIR/scrape:/home" \
  patch-scraper \
  python3 /home/$NAME.py \
  1>/tmp/patch/$NAME/scrape.suc \
  2>/tmp/patch/$NAME/scrape.err;

exit $?
