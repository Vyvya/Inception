#!/bin/sh

# Create a database and user and give them access to the database
mysql_install_db
/etc/init.d/mysql start

#service mysql start

# Create a table with the name of the environmental variable SQL_DATABASE
# defined in .env, sent by docker-compose.yaml
# mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
echo "CREATE DATABASE IF NOT EXISTS ${MYDB_NAME};" > mydb.sql


# Create a user: SQL_USER, if it doesn't exist, with password SQL_PASSWORD,
# defined in .env
# mysql -e to execute cmd directly
echo "CREATE USER IF NOT EXISTS ${MYDB_USER}@'%' IDENTIFIED BY '${MYDB_PWD}';" >> mydb.sql

# Give all rights to SQL_USER, with password SQL_PASSWORD, for the table SQL_DATABASE
echo "GRANT ALL PRIVILEGES ON ${MYDB_NAME}.* TO ${MYDB_USER}@'%' ;" >> mydb.sql #IDENTIFIED BY '${MYSQL_PASSWORD}'

# Change the root password
echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYDB_ROOT_PWD}';" >> mydb.sql

# Refresh privileges for MySQL
echo "FLUSH PRIVILEGES;" >> mydb.sql

# Stop the MySQL server
/etc/init.d/mysql stop

#kill $(cat /var/run/mysqld/mysqld.pid)
# To keep the container running
exec "$@"
# mysqld

#!/bin/sh

# # init Mariadb data directory
# if [ ! -d "/var/lib/mysql/mysql" ]; then
#     mysql_install_db --user=mysql --datadir=/var/lib/mysql
# fi

# # start mariadb in the background
# mysqld --user=mysql --datadir=/var/lib/mysql &

# mysql_pid=$!

# # Wait for MariaDB to become available
# until mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} ping >/dev/null 2>&1; do
#     sleep 1
# done

# ADMIN_PASSWORD=$(openssl passwd -1 "$WP_ADMIN_PASSWORD" | sed 's/\//\\\//g')
# PASSWORD=$(openssl passwd -1 "$WP_PASSWORD" | sed 's/\//\\\//g')

# sed -i "s/{WP_ADMIN_USER}/${WP_ADMIN_USER}/g" wordpress.sql
# sed -i "s/{WP_ADMIN_PASSWORD}/${ADMIN_PASSWORD}/g" wordpress.sql
# sed -i "s/{WP_ADMIN_EMAIL}/${WP_ADMIN_EMAIL}/g" wordpress.sql
# sed -i "s/{WP_ADMIN_URL}/${WP_ADMIN_URL}/g" wordpress.sql

# sed -i "s/{WP_USER}/${WP_USER}/g" wordpress.sql
# sed -i "s/{WP_PASSWORD}/${PASSWORD}/g" wordpress.sql
# sed -i "s/{WP_EMAIL}/${WP_EMAIL}/g" wordpress.sql
# sed -i "s/{WP_URL}/${WP_URL}/g" wordpress.sql

# # Run SQL commands
# sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
# sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
# sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} inception -e "SELECT COUNT(id) FROM wp_users;" > /dev/null

# if [ $? -ne 0 ]; then
#          sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} $MYSQL_DATABASE < wordpress.sql
# fi

# kill "$mysql_pid"

# # Wait for the MariaDB process to stop completely
# wait "$mysql_pid"

# # Start MariaDB in the foreground
# exec mysqld --user=mysql