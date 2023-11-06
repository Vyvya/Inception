FROM debian:buster

# RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server expect gettext-base

# Create necessary directories
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod -R 755 /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 755 /var/lib/mysql

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod 777 /usr/local/bin/script.sh

COPY /tools/mysql_secure.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/mysql_secure.sh 

RUN ./usr/local/bin/script.sh
CMD ["mysqld_safe"]
# ENTRYPOINT ["/usr/local/bin/script.sh"]
