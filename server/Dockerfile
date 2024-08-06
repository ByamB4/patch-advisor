FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONBUFFERED=1

# system related
RUN apt-get update \
  && apt-get install -y python3 \
  && apt-get install -y python3-pip \
  && apt-get install -y vim

# playwright related
RUN apt-get update \
  && pip install pytest-playwright \
  && pip install playwright-stealth \
  && pip install python-dotenv \
  && playwright install-deps \
  && playwright install

# prisma related
RUN apt-get update \
  && pip install prisma \
  && prisma generate --schema=/home/server/prisma/schema.prisma \
  && prisma migrate dev --schema=/home/server/prisma/schema.prisma