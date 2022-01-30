## 手順

### imageを作成していない場合
ファイルのマウント
```
docker cp create_db.sh sampldb:/docker-entrypoint-initdb/create_db.sh
docker cp create_db.sh unruffled_keller:/docker-entrypoint-initdb.d/create_db.sh
```

コンテナからdocker imageを作る
```
docker commit unruffled_keller sanoyo/postgres-dvdrental-database
```

実行
```
docker run -d -p 5433:5432 --name dvdrental-db sanoyo/postgres-dvdrental-database
```

### imageを作成済みの場合


実行
```
docker run -d -p 5433:5432 --name dvdrental-db sanoyo/postgres-dvdrental-database
```
