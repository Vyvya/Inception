#!/bin/sh

set -e

# # Check if the data directory exists
# if [ ! -f "/var/lib/mysql/" ]; then
#     mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#     service mysql start
# fi

if ! systemctl is-active --quiet mariadb; then
#     # MariaDB is running
# else
#     # MariaDB is not running, so start it
    rm -R /var/lib/mysql/*
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    service mysql start
fi

echo "mariadb: mysql_secure_installation..."
/bin/bash /usr/local/bin/mysql_secure.sh
echo "done."

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';"

echo ".......user created........"
# Start MariaDB with TCP protocol
# mysqld --user=mysql --datadir=/var/lib/mysql

mysqladmin shutdown
echo ".......mysqladmin shutdown........"

exec mysqld_safe


# if [ $(service mysql status >/dev/null 2>&1; echo $?) -eq 3 ]; then
# 	rm -R /var/lib/mysql/*
# 	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# 	service mysql start
# fi