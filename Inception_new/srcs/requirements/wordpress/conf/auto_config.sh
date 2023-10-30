#!/bin/sh

sleep 5

if [ ! -f /var/www/html/wp-config.php ]; then
    wget https://wordpress.org/latest.tar.gz -P /var/www/ \
    && cd /var/www/ && tar -xzf latest.tar.gz && rm latest.tar.gz
    wp core download --allow-root
    wp config create --allow-root \
     --dbname=$DB_NAME \
     --dbuser=$DB_USER \
     --dbpass=$DB_PASSWORD \
     --dbhost=$DB_HOST --path='/var/www/html'
    wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$USER_NAME --admin_password=$DB_ROOT_PASSWORD --admin_email=$USER_ADMIN_EMAIL --skip-email --allow-root --path='/var/www/html'
    wp user create $DB_USER $USER_EMAIL --user_pass=$DB_PASSWORD --role=suscriber --allow-root --path='/var/www/html'
    wp theme install astra --activate --allow-root --path='/var/www/html'
    # Other installation steps
else
    echo "WordPress is already installed."
fi

# Check if WP-CLI configuration was successful
# if [ $? -eq 0 ]; then
#      echo "WordPress configuration was successful."
# else
#      echo "WordPress configuration failed."
#      exit 1  # You can choose to exit the script or handle errors differently
# fi

# # Start PHP-FPM
# if [ ! -d /run/php ]; then
#     mkdir -p /run/php
# fi

/usr/sbin/php-fpm7.3 -F

# exec "$@"
