#!/bin/bash

docker run --rm -v /root/patch-advisor/scrape:/home ubuntu-scrape python3 /home/vmware.py
