#!/bin/sh

mysql_install_db

mysqld --user=mysql &

# Wait for MariaDB to start
while ! mysqladmin ping -h127.0.0.1 --silent; do
    sleep 1
done

echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# Do not stop the MariaDB service here, let Docker manage it
# /etc/init.d/mysql stop

exec "$@"