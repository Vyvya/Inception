#!/bin/sh
# set -x
# sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
    wget https://wordpress.org/latest.tar.gz -P /var/www/html \
    && cd /var/www/html && tar -xzf latest.tar.gz && rm latest.tar.gz
    wp core download --allow-root
    wp config create --allow-root \
     --dbname=$WORDPRESS_DB_NAME \
     --dbuser=$WORDPRESS_DB_USER \
     --dbpass=$WORDPRESS_DB_PASSWORD \
     --dbhost=$WORDPRESS_DB_HOST:3306 --path='/var/www/html'
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root --path='/var/www/html'
    wp user create $WORDPRESS_DB_USER $DB_EMAIL --user_pass=$WP_PWD --role=author --allow-root --path='/var/www/html'
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
