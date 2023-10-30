#!/bin/sh

chown -R mysql:mysql /var/lib/mysql

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

/usr/bin/mysqld_safe --bind-address=0.0.0.0
