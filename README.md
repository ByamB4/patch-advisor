## Build everything

### Start database

```sh
1. cd db
2. docker compose up -d
```

### Start python services

```sh
1. cd server
2. docker build -t patch-python -f Dockerfile .
3. docker run --rm -v $(pwd)/server:/home -e PYTHONBUFFERED=1 patch-python python3
/home/src/redhat.py
```

### Start client using pm2

```sh
1. pnpm build
2. pnpm start
3. pm2 start
```
