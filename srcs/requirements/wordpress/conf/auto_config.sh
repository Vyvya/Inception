#!/bin/sh
# set -x
# sleep 10

mkdir /var/www/
mkdir /var/www/html

chown -R www-data:www-data /var/www/
chmod -R 755 /var/www/html/

cd /var/www/html

rm -rf*

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
#RUN sudo mv wp-cli.phar /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root
    # Other installation steps
else
    echo "WordPress is already installed."
fi

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv ./tools/wp-config.php /var/www/html/wp-config.php


sed -i -r "s/db1/$DB_NAME/1"   wp-config.php
sed -i -r "s/user/$DB_USER/1"  wp-config.php
sed -i -r "s/pwd/$DB_PWD/1"    wp-config.php

# Set up the database configuration with WP-CLI, creates a configuration file
# wp config create --allow-root \
#      --dbname="$MYSQL_DATABASE" \
#      --dbuser="$MYSQL_USER" \
#      --dbpass="$MYSQL_PASSWORD" \
#      --dbhost="$MYSQL_HOST:3306" \
#      #--dbhost="$MYSQL_HOSTNAME" \
#      --path='/var/www/html'

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/html'
wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PWD --role=author --allow-root --path='/var/www/html'
wp theme install astra --activate --allow-root --path='/var/www/html'

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

