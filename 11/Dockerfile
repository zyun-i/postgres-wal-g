FROM postgres:11

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/bin \
 && curl -L https://github.com/wal-g/wal-g/releases/download/v0.2.9/wal-g.linux-amd64.tar.gz | tar -zxvf - 
