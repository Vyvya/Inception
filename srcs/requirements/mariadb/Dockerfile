FROM debian:bullseye

RUN apt update # && apt-get install -y \
    mariadb-server mariadb-client \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Create the mysql user and group
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql
    #sed -i s/127.0.0.1/0.0.0.0/ /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the entrypoint script and make it executable
COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

#RUN mkdir -p /run/mysqld /var/lib/mysql && \
#   chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Make your script executable
#RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint to the MariaDB entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]
#CMD ["tail", "-f"]

EXPOSE 3306
CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql"]

#alternative: mysqld_safe is typically used to start the MySQL server when the system is booting,
#and it is also used to start and stop the MySQL server manually
#CMD ["/usr/bin/mysqld_safe"]