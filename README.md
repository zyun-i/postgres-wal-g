# postgres-wal-g

## Settings

### PostgreSQL

postgresql.conf

```
archive_mode = on
archive_command = '/usr/local/bin/wal-g wal-push %p'
archive_timeout = 60
```

### docker environemnt

s3 example:

```
WALG_COMPRESSION_METHOD=brotli
WALE_S3_PREFIX=s3://example-bucket/postgres
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
PGHOST=/var/run/postgresql"
```

## How to backup

Manual full backup.

```sh
docker-compose exec -u postgres wal-g bash
wal-g backup-push ${PGDATA}
```

cron.

```
@daily /usr/local/bin/wal-g backup-push ${PGDATA}
@weekly /usr/local/bin/wal-g delete retain 10 --confirm  
```
