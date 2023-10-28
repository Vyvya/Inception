FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 755 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 755 /etc/mysql/mariadb.conf.d

# Copy the entrypoint script and make it executable
COPY ./tools/script.sh /usr/local/bin
RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["/usr/local/bin/script.sh"]

EXPOSE 3306