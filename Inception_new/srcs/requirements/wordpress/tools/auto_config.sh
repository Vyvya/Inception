#!/bin/sh

 wp-cli.phar config create --dbhost=mysql --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root
 wp-cli.phar core install --url=${DOMAIN_NAME} --title=${TITLE} --admin_user=${USER_NAME} --admin_password=${USER_ADMIN_PASS} --admin_email=${USER_ADMIN_EMAIL} --skip-email  --allow-root
#  wp-cli.phar user create ${DB_USER} ${USER_EMAIL} --user_pass=${DB_PASSWORD} --role=suscriber --allow-root
    # wp theme install astra --activate --allow-root
    # Other installation steps

/usr/sbin/php-fpm7.3 -F