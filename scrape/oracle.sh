#!/bin/bash
DEBUG=1;
name='oracle';
if [ "$DEBUG" -eq 1 ]; then
  path='/home/byamb4/dev/patch-advisor';
else
  path='/root/patch-advisor';
fi
docker run --rm -v $path/scrape:/home ubuntu-scrape python3 /home/$name.py >/tmp/patch/$name/scrape.suc 2>/tmp/patch/$name/scrape.err;
