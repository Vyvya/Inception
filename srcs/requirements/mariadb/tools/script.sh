#!/bin/sh

# sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Start the MySQL service
service mysql start

# Check if the service is not running
if ! service mysql status | grep -q 'active (running)'; then
    # If the service is not running, perform these actions

    # Initialize the MySQL database
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

    # Start the MySQL service
    service mysql start

    # Create the database, user, and grant privileges
    cat > configure.sql << EOF
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    FLUSH PRIVILEGES;
EOF

    mariadb -uroot < ./configure.sql

    rm ./configure.sql

    # Stop the MySQL service
    # service mysql stop

    # Shutdown the MySQL server
    mysqladmin shutdown
fi

# Shutdown the MySQL server (added this line at the end as well)
mysqladmin shutdown

# Start the MySQL server in safe mode
exec mysqld_safe



# #!/bin/sh

# # sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# service mysql start
# # set -e

# if ! service mysql status | grep -q 'active (running)'; then
#     mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#     service mysql start
#     cat > configure.sql << EOF
#     CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
#     CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#     FLUSH PRIVILEGES;
#     EOF

#     mariadb -uroot < ./configure.sql


#     rm ./configure.sql

#     # service mysql stop

#     mysqladmin shutdown
# fi
# mysqladmin shutdown


# exec mysqld_safe
