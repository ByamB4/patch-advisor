FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 \
  && apt-get install -y python3-pip \
  && apt-get install -y vim \
  && pip install pytest-playwright \
  && playwright install-deps \
  && playwright install



# RHSA-2024:3576