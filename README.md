## Build everything

### Start database

```sh
1. cd db
2. docker compose up -d
```

### Build python services

```sh
1. cd server
2. docker build -t patch-python -f Dockerfile .
```

### Start client using pm2

```sh
1. pnpm i
2. prisma generate
3. prisma migrate dev
4. pnpm build
5. pm2 start "pnpm start" --name patch-next
```

### Setup python services

```sh
1. cd server
2. create python virtual env (this is not command)
3. pip install prisma
4. prisma generate
5. prisma migrate dev
6. python src/redhat.py
7. python src/cisco.py
```
