# postgres-wal-g

## Settings

postgresql.conf

```
archive_mode = on
archive_command = '/usr/bin/timeout 600 /usr/local/bin/wal-g wal-push %p'
archive_timeout = 600
```

## How to backup.

```sh
docker-compose exec -u postgres wal-g bash
wal-g backup-push ${PGDATA}
```
