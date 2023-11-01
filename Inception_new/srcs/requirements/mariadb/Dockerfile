FROM debian:buster

# RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server expect

# Create necessary directories
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld
RUN chmod -R 755 /var/run/mysqld
RUN chown -R mysql:root /var/lib/mysql
RUN chmod -R 755 /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

COPY ./tools/mysql_secure.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mysql_secure.sh 

ENTRYPOINT ["/usr/local/bin/script.sh"]

# Start MariaDB using your script
# CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]


