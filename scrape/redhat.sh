#!/bin/bash

docker run --rm -v /root/patch-advisor/scrape:/home ubuntu-scrape python3 /home/redhat.py >/tmp/patch/redhat/scrape.suc 2>/tmp/patch/redhat/scrape.err
