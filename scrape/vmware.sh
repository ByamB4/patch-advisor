#!/bin/bash

# docker run --rm -v /root/patch-advisor/scrape:/home ubuntu-scrape python3 /home/vmware.py >/tmp/patch/vmware/scrape.suc.$(date +\%d.\%H.\%M) 2>/tmp/patch/vmware/scrape.err.$(date +\%d.\%H.\%M)
docker run --rm -v /root/patch-advisor/scrape:/home ubuntu-scrape python3 /home/vmware.py
