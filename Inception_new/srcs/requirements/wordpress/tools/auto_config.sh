#!/bin/sh

echo -e "\e[31m$DB_HOST\e[0m"

# /bin/ls 

# if [ ! -f /var/www/wordpress/wp-config.php ]; then
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # rm -f /var/www/html/wp-config.php
 

        # wp create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root
        echo ................blu...............

        /bin/ls 
        
        wp core download --allow-root
        wp config create --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root
        #  wp-cli.phar user create ${DB_USER} ${USER_EMAIL} --user_pass=${DB_PASSWORD} --role=suscriber --allow-root
            # wp theme install astra --activate --allow-root
            # Other installation steps

        echo ................bla...............
        # /bin/ls 
        /usr/sbin/php-fpm7.3 -F

        echo ................blxxxxx...............
# fi

echo -e "\e[31m$DB_HOST\e[0m"
echo -e "\e[31m$DB_NAME\e[0m"
echo -e "\e[31m$DB_USER\e[0m"
echo -e "\e[31m$DB_PASSWORD\e[0m"

