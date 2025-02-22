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
3. source venv/bin/activate
3. pip install prisma
4. pip install requests
5. prisma generate
6. prisma migrate dev
7. python src/redhat.py
8. python src/cisco.py
```

### Build python services

```sh
1. cd server
2. Update /src/configs.py DEBUG=False
2. docker build -t patch-python -f Dockerfile .
3. docker run --rm -v $(pwd):/home patch-python python3 /home/src/microsoft.py
4. docker run --rm -v $(pwd):/home patch-python python3 /home/src/hackernews.py
5. python src/db_write.py
```

### Set up cron job

```sh
1. crontab -e
PATCH_PATH=/root/Patch-Advisory
0 * * * * $PATCH_PATH/server/venv/bin/python3 $PATCH_PATH/server/src/redhat.py 2>/tmp/redhat.err
0 * * * * $PATCH_PATH/server/venv/bin/python3 $PATCH_PATH/server/src/cisco.py 2>/tmp/cisco.err
0 * * * * cd $PATCH_PATH/server; docker run --rm -v $(pwd):/home patch-python python3 /home/src/hackernews.py 2>/tmp/hackernews.err;
0 * * * * cd $PATCH_PATH/server; docker run --rm -v $(pwd):/home patch-python python3 /home/src/microsoft.py 2>/tmp/microsoft.err;
*/30 * * * * $PATCH_PATH/server/venv/bin/python3 $PATCH_PATH/server/src/db_write.py 2>/tmp/db_write.err
```
