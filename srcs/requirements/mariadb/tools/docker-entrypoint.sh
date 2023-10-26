#!/bin/sh

#Create a database and user and give him the access to the database then FLUCH PRIVILEGES
mysql_install_db

#start MySQL
/etc/init.d/mysql start;

#create a table, with the name of the environmental variable SQL_DATABASE, defined in .env, send by docker-compose.yaml
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

#create a user: SQL_USER, if it doesnt exist, with password SQL_PASSWORD, defined in .env
mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#give all rights to SQL_USER, with password SQL_PASSWORD for the table SQL_DATABASE
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#change the rights root of localhost, with password root SQL_ROOT_PASSWORD
mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#refresh all, so that MySQL takes changes into account
mysql -e "FLUSH PRIVILEGES;"

#restart MySQL for all this to take effect
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

/etc/init.d/mysql stop

#to keep container running
exec "$@"