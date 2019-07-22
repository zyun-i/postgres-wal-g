FROM postgres:10

RUN apt-get update && apt-get install -y \
    daemontools \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/bin \
 && curl -L https://github.com/wal-g/wal-g/releases/download/v0.2.9/wal-g.linux-amd64.tar.gz | tar -zxvf - 

RUN mkdir -p /etc/wal-g.d/env

#CMD ["-c", "wal_level=archive", "-c", "archive_mode=on", "-c", "archive_command='/usr/bin/timeout 600 /usr/local/bin/wal-g wal-push /var/lib/postgresql/data/%p'", "-c", "archive_timeout=600"]
#CMD ["-c", "wal_level=archive", "-c", "archive_mode=on", "-c", "archive_command='ls'", "-c", "archive_timeout=60", "-c", "log_statement=all"]
#CMD ["-c", "archive_mode=on", "-c", "archive_command='/usr/bin/timeout 600 /usr/local/bin/wal-g wal-push %p'", "-c", "archive_timeout=600", "-c", "log_statement=all"]
CMD ["-c", "config_file=/etc/postgresql/postgresql.conf"]
