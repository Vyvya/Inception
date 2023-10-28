FROM debian:buster

# Install required packages
RUN apt-get update && apt-get -y install wget \
    php7.3 php7.3-fpm php7.3-mysql php7.3-phar \
    php7.3-json php7.3-xml php7.3-mbstring \
    php7.3-curl php7.3-gd php7.3-intl php7.3-zip \
    mariadb-client

# Set the working directory
WORKDIR /var/www/html

# Ensure the directory is owned by the web server user (www-data)
RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/html/

#WP-CLI is the command-line interface for WordPress. You can update plugins, 
#configure multisite installations and much more, without using a web browser
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /var/www/html/wordpress
#RUN cp conf/wp-config.php /var/www/html/wp-config.php

# Give ownership to the web server user (www-data)
RUN	chown -R root:root /var/www/html

EXPOSE 9000

# RUN chmod +x /run/
RUN mkdir -p /run/php
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh

ENTRYPOINT ["/bin/sh", "/usr/local/bin/auto_config.sh"]

