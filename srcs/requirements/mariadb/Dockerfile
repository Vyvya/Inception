FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=db
ENV MYSQL_USER=vg
ENV MYSQL_PASSWORD=vg

# Make your script executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set the entrypoint to the MariaDB entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]
#CMD ["tail", "-f"]
CMD ["mysqld"]

#alternative: mysqld_safe is typically used to start the MySQL server when the system is booting,
#and it is also used to start and stop the MySQL server manually
#CMD ["/usr/bin/mysqld_safe"]