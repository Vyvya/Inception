FROM debian:buster

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client sudo openssl

# Create necessary directories
RUN mkdir -p /var/lib/mysql /var/run/mysqld

WORKDIR /tmp/mariadb

# Copy scripts and configuration
COPY ./tools/script.sh .
RUN chmod +x ./script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Set ownership and permissions
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN chmod -R 755 /var/lib/mysql /var/run/mysqld

# Expose the MySQL port
EXPOSE 3306

# Start MariaDB using your script
CMD ["./script.sh"]










# FROM debian:buster

# RUN groupadd -r mysql && useradd -r -g mysql mysql


# RUN apt-get update -y && apt-get upgrade -y
# RUN apt-get install -y mariadb-server mariadb-client sudo openssl
#     # rm -rf /var/cache/apt/* && \
#     # mkdir -p /var/run/mysqld /var/lib/mysql
# WORKDIR /tmp/mariadb

# RUN mkdir -p /var/lib/mysql /var/run/mysqld

# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
# RUN chmod -R 755 /var/lib/mysql /var/run/mysqld

# COPY ./tools/script.sh .
# RUN chmod +x ./script.sh


# COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
# COPY ./conf/50-server.cnf /etc/mysql/my.cnf

# EXPOSE 3306

CMD ["./script.sh"]



# RUN chmod 777 ./50-server.cnf
# RUN mv ./50-server.cnf /config
# RUN sed -i 's!#port!port !g' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i 's!127.0.0.1!0.0.0.0!g' /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/my.cnf
# RUN chown -R mysql:mysql /var/run/mysqld; chown -R mysql:mysql /var/lib/mysql
# RUN chown -R mysql /var/lib/mysql
# COPY ./conf/conf.cnf /etc/mysql/my.cnf
# RUN mkdir -p /var/run/mysqld \
#     && chown -R mysql:mysql /var/run/mysqld \
#     && git add .


# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/50-server.cnf /etc/mysql/my.cnf
# RUN chown -R mysql:mysql /var/run/mysqld; chown -R mysql:mysql /var/lib/mysql
# RUN chmod -R 755 /var/lib/mysql
# # COPY ./conf/conf.cnf /etc/mysql/my.cnf
# # RUN mkdir -p /var/run/mysqld \
# #     && chown -R mysql:mysql /var/run/mysqld \
# #     && git add .


# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./conf/50-server.cnf /etc/mysql/my.cnf
# RUN chmod 755 /etc/mysql/mariadb.conf.d
# RUN sed -i 's!#port!port !g' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i 's!127.0.0.1!0.0.0.0!g' /etc/mysql/mariadb.conf.d/50-server.cnf
# # Copy the entrypoint script and make it executable
# COPY ./tools/script.sh /usr/local/bin
# RUN chmod +x /usr/local/bin/script.sh

# # ENTRYPOINT ["/usr/local/bin/script.sh"]

# 

# CMD ["sh", "/usr/local/bin/script.sh"]