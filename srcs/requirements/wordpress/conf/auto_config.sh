#!/bin/sh
# sleep 10

# # Set up the database configuration with WP-CLI
# wp config create --allow-root \
#     --dbname="$MYSQL_NAME" \
#     --dbuser="$MYSQL_USER" \
#     --dbpass="$MYSQL_PASSWORD" \
#     --dbhost="$MYSQL_HOST:3306" \
#     --path='/var/www/wordpress'

# # Check if WP-CLI configuration was successful
# if [ $? -eq 0 ]; then
#     echo "WordPress configuration was successful."
# else
#     echo "WordPress configuration failed."
#     exit 1  # You can choose to exit the script or handle errors differently
# fi

# Create the first user (e.g., administrator)
#wp user create username1 admin@example.com --role=administrator --user_pass=some_password

# Create the second user
#wp user create username2 user@example.com --user_pass=another_password

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F