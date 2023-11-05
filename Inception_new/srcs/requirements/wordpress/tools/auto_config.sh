#!/bin/sh

echo -e "\e[31m$DB_HOST\e[0m"

# /bin/ls 

# if [ ! -f /var/www/wordpress/wp-config.php ]; then
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # rm -f /var/www/html/wp-config.php
 

        # wp create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root
# until mysqladmin ping -h "mariadb" --silent; do
#     echo "Waiting for MariaDB to be ready..."
#     sleep 1
# done
# echo "|-- Starting Wordpress setup. --|"

rm -f /var/www/html/wp-config.php
        
wp core download --allow-root
wp config create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --skip-check --allow-root
wp core install --url=${DOMAIN_NAME} --title=${vgejnoINCEPTION} --admin_user=${USER_ADMIN_NAME} --admin_password=${USER_ADMIN_PASSWORD} --admin_email=${USER_ADMIN_EMAIL} --allow-root
wp user create ${DB_USER} ${DB_EMAIL} --user_pass=${DB_PASSWORD} --role=suscriber --allow-root
wp theme install divi --activate --allow-root

echo ................bla...............
# /bin/ls 
/usr/sbin/php-fpm7.3 -F

echo ................blxxxxx...............
# fi

echo -e "\e[31m$DB_HOST\e[0m"
echo -e "\e[31m$DB_NAME\e[0m"
echo -e "\e[31m$DB_USER\e[0m"
echo -e "\e[31m$DB_PASSWORD\e[0m"

