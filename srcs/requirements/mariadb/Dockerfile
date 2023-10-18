FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/create_database.sh .

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=db
ENV MYSQL_USER=vg
ENV MYSQL_PASSWORD=vg

# Make your script executable
RUN chmod +x create_database.sh

# Set the entrypoint to the MariaDB entrypoint script
#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f"]
# CMD ["mysqld"]
