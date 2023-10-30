#!/bin/sh

# Check if the data directory exists
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    service mysql start
    service mysql start
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_ROOT_PASSWORD
    service mysql stop
fi

/usr/bin/mysqld_safe

# Start MariaDB in the background
# mysqld --user=mysql --datadir=/var/lib/mysql &

# Store the PID of the mysqld process
# mysql_pid=$!

# Wait for MariaDB to become available
# until mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} ping >/dev/null 2>&1; do
#     sleep 1
# done

# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root -p
# "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"

# # ADMIN_PASSWORD=$(openssl passwd -1 "$WP_ADMIN_PASSWORD" | sed 's/\//\\\//g')
# # PASSWORD=$(openssl passwd -1 "$WP_PASSWORD" | sed 's/\//\\\//g')

# # # Initialize the database and permissions
# # sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p${MYSQL_ROOT_PASSWORD}
# # sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p${MYSQL_ROOT_PASSWORD}

# if [ $? -ne 0 ]; then
#          sudo mysql -u root -p${MYSQL_ROOT_PASSWORD} $MYSQL_DATABASE
# fi

# # Wait for the MariaDB process to shut down gracefully
# wait "$mysql_pid"

# # Start MariaDB in the foreground
# exec mysqld --user=mysql