#!/bin/sh

sleep 5
# rm -f /var/www/wordpress/wp-config.php
        
# wp core download --allow-root
# wp config create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --skip-check --allow-root
wp core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${USER_ADMIN_NAME} --admin_password=${USER_ADMIN_PASSWORD} --admin_email=${USER_ADMIN_EMAIL} --skip-email --allow-root
wp user create ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASSWORD} --role=subscriber --allow-root
wp theme install divi --activate --allow-root

/usr/sbin/php-fpm7.3 -F
