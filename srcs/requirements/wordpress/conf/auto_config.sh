#!/bin/sh
set -x
sleep 10

# Set up the database configuration with WP-CLI, creates a configuration file
wp config create --allow-root \
     --dbname="$MYSQL_DATABASE" \
     --dbuser="$MYSQL_USER" \
     --dbpass="$MYSQL_PASSWORD" \
     --dbhost="$MYSQL_HOST:3306" \
     #--dbhost="$MYSQL_HOSTNAME" \
     --path='/var/www/html'

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/html'
wp user create $MYSQL_USER1 $MYSQL_USER_MAIL1 --user_pass=$MYSQL_PASSWORD1 --role=author --allow-root --path='/var/www/html'
wp theme install hestia --activate --allow-root --path='/var/www/html'

# Check if WP-CLI configuration was successful
 if [ $? -eq 0 ]; then
     echo "WordPress configuration was successful."
 else
     echo "WordPress configuration failed."
     exit 1  # You can choose to exit the script or handle errors differently
 fi

# Start PHP-FPM
#/usr/sbin/php-fpm7.3 -F
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

exec "$@"

#Create the first user (e.g., administrator)
#wp user create username1 admin@example.com --role=administrator --user_pass=some_password

# Create the second user
#wp user create username2 user@example.com --user_pass=another_password

