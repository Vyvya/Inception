#!/bin/sh

set -e

if ! systemctl is-active --quiet mariadb; then
    rm -R /var/lib/mysql/*
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    service mysql start
fi

cat > configure.sql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
EOF

mariadb -uroot < ./configure.sql

mysqladmin shutdown

exec mysqld_safe
