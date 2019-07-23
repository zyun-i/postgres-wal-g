# postgres-wal-g

[![GitHub release](https://img.shields.io/github/release/zyun-i/postgres-wal-g.svg)][releases]
[![Travis CI build status](https://img.shields.io/travis/zyun-i/postgres-wal-g/master.svg?label=Travis%20CI)][travis]
[![Docker Pulls](https://img.shields.io/docker/pulls/zyun1/postgres-wal-g.svg)][docker]

[releases]: https://github.com/zyun-i/postgres-wal-g/releases
[travis]: https://travis-ci.org/zyun-i/postgres-wal-g/branches
[docker]: https://hub.docker.com/r/zyun1/postgres-wal-g/

PostgreSQL docker image with [wal-g](https://github.com/wal-g/wal-g).

## Settings

### PostgreSQL

postgresql.conf

```conf
archive_mode = on
archive_command = '/usr/local/bin/wal-g wal-push %p'
archive_timeout = 60
```

### docker environemnt

s3 example:

```env
WALG_COMPRESSION_METHOD=brotli
WALE_S3_PREFIX=s3://example-bucket/postgres
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
PGHOST=/var/run/postgresql
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

## Test

```sh
docker-compose build
docker-compose up -d
```
