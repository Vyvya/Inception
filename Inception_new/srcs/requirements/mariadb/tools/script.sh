#!/bin/sh

# Check if the data directory exists
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    service mysql start
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
    mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password $DB_ROOT_PASSWORD
    service mysql stop
fi

# Start MariaDB with TCP protocol
/usr/bin/mysqld_safe --bind-address=0.0.0.0

#--protocol=TCP









#!/bin/sh

# mkdir -p /var/lib/mysql /var/run/mysqld

# chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
# chmod -R 755 /var/lib/mysql /var/run/mysqld

# touch /var/run/mysqld/mysqld.pid
# touch /var/run/mysqld/mysqld.sock

# chown -R mysql:mysql /var/run/mysqld/mysqld.sock
# chown -R mysql:mysql /var/run/mysqld/mysqld.pid
# chmod -R 644 /var/run/mysqld/mysqld.sock

# Check if the data directory exists
# if [ ! -d "/var/lib/mysql/mysql" ]; then
#     mysql_install_db --user=mysql --datadir=/var/lib/mysql
#     service mysql start
#     mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8;"
#     mysql -u root -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
#     mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
#     mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
#     mysql -u root -e "FLUSH PRIVILEGES;"
#     mysqladmin -u root password $DB_ROOT_PASSWORD
#     service mysql stop
# fi

# # systemctl enable mariadb
# # /usr/bin/mysqld_safe --bind-address=0.0.0.0
# /etc/init.d/mysql start --protocol=TCP
