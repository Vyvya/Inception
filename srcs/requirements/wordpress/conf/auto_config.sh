#!/bin/bash
sleep 10

# Set up the database configuration with WP-CLI
wp config create --allow-root \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --dbhost="$WORDPRESS_DB_HOST:3306" \
    --path='/var/www/wordpress'

# Check if WP-CLI configuration was successful
if [ $? -eq 0 ]; then
    echo "WordPress configuration was successful."
else
    echo "WordPress configuration failed."
    exit 1  # You can choose to exit the script or handle errors differently
fi

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F