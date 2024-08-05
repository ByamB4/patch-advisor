FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3 \
  && apt-get install -y python3-pip \
  && apt-get install -y vim \
  && pip install pytest-playwright \
  && pip install playwright-stealth \
  && pip install python-dotenv \
  && pip install prisma \
  && pip install prisma-client \
  && prisma generate \
  && prisma migrate  \
  && playwright install-deps \
  && playwright install

