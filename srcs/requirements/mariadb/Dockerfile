FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    bash vim \
    && rm -rf /var/lib/apt/lists/*

# Create the mysql user and group
#RUN groupadd -r mysql && useradd -r -g mysql mysql
# RUN groupadd -r mysql || true
# RUN useradd -r -g mysql mysql || true

# RUN userdel mysql
# RUN useradd -u 999 mysql

# RUN mkdir -p /mariadb_data/mysql \
#     && chown -R mysql:mysql /mariadb_data/mysql

# RUN mkdir -p /mariadb_data \
#     && chown -R mysql:mysql /mariadb_data

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 755 /var/run/mysqld
    #sed -i s/127.0.0.1/0.0.0.0/ /etc/mysql/mariadb.conf.d/50-server.cnf
    
# RUN chmod 755 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 755 /etc/mysql/mariadb.conf.d

# Copy the entrypoint script and make it executable
COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

#ENTRYPOINT ["/usr/local/bin/script.sh"]
#CMD ["tail", "-f"]
CMD ["/usr/local/bin/script.sh"]

EXPOSE 3306
CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]
#

#alternative: mysqld_safe is typically used to start the MySQL server when the system is booting,
#and it is also used to start and stop the MySQL server manually
#CMD ["/usr/bin/mysqld_safe"]