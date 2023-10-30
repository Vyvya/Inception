FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y mariadb-server mariadb-client sudo openssl && \
    rm -rf /var/cache/apt/* && \
    mkdir -p /var/run/mysqld /var/lib/mysql

RUN chown -R mysql:mysql /var/run/mysqld; chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 755 /var/lib/mysql
# COPY ./conf/conf.cnf /etc/mysql/my.cnf
# RUN mkdir -p /var/run/mysqld \
#     && chown -R mysql:mysql /var/run/mysqld \
#     && git add .


COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/50-server.cnf /etc/mysql/my.cnf
RUN chmod 755 /etc/mysql/mariadb.conf.d
RUN sed -i 's!#port!port !g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's!127.0.0.1!0.0.0.0!g' /etc/mysql/mariadb.conf.d/50-server.cnf
# Copy the entrypoint script and make it executable
COPY ./tools/script.sh /usr/local/bin
RUN chmod +x /usr/local/bin/script.sh

# ENTRYPOINT ["/usr/local/bin/script.sh"]

EXPOSE 3306

CMD ["sh", "/usr/local/bin/script.sh"]