#!/bin/sh
# set -x
# sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    wget https://wordpress.org/latest.tar.gz -P /var/www/html \
    && cd /var/www/html && tar -xzf latest.tar.gz && rm latest.tar.gz
    wp core download --allow-root
    wp config create --allow-root \
     --dbname=$MYSQL_DATABASE \
     --dbuser=$MYSQL_USER \
     --dbpass=$MYSQL_PASSWORD \
     --dbhost=$WORDPRESS_DB_HOST:3306 --path='/var/www/html'
    wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root --path='/var/www/html'
    wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_EMAIL --user_pass=$WORDPRESS_DB_PASSWORD --role=author --allow-root --path='/var/www/html'
    wp theme install astra --activate --allow-root --path='/var/www/html'
    # Other installation steps
else
    echo "WordPress is already installed."
fi

# Check if WP-CLI configuration was successful
if [ $? -eq 0 ]; then
     echo "WordPress configuration was successful."
else
     echo "WordPress configuration failed."
     exit 1  # You can choose to exit the script or handle errors differently
fi

# Start PHP-FPM
if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi
/usr/sbin/php-fpm7.3 -F

exec "$@"
