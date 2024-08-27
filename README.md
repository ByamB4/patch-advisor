## Build everything

### Start database

```sh
1. cd db
2. docker compose up -d
```

### Start client using pm2

```sh
1. pnpm i
2. npx prisma generate
3. npx prisma migrate dev
4. pnpm build
5. pm2 start "pnpm start" --name patch-next
6. pm2 startup
```

### Setup python services

```sh
1. cd server
2. python3.11 -m venv venv
3. source env/bin/activate
3. pip install prisma
4. pip install requests
5. prisma generate
6. prisma migrate dev
7. python src/redhat.py
8. python src/cisco.py
9. update .env DEBUG -> False
```

### Build python services

```sh
1. cd server
2. docker build -t patch-python -f Dockerfile .
3. docker run --rm -v $(pwd)/server:/home -e PYTHONBUFFERED=1 patch-python python3 /home/src/microsoft.py
```
