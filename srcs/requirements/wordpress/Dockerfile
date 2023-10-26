FROM debian:buster

# Install required packages
RUN apt-get update && apt-get -y install wget \
    php7.3 php7.3-fpm php7.3-mysql php7.3-phar \
    php7.3-json php7.3-xml php7.3-mbstring \
    php7.3-curl php7.3-gd php7.3-intl php7.3-zip \
    mariadb-client

# Set the working directory
#USER www-data:www-data
WORKDIR /var/www/html

# Create the directory within the container
#RUN mkdir -p /var/www/html/wp-content/uploads

# Ensure the directory is owned by the web server user (www-data)
RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/html/

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html \
    && cd /var/www/html && tar -xzf latest.tar.gz && rm latest.tar.gz

#WP-CLI is the command-line interface for WordPress. You can update plugins, 
#configure multisite installations and much more, without using a web browser
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
#RUN sudo mv wp-cli.phar /usr/local/bin/wp
RUN mv wp-cli.phar /usr/local/bin/wp
#RUN cp conf/wp-config.php /var/www/html/wp-config.php

# Create the directory if it doesn't exist
RUN mkdir -p /run/php
#RUN mkdir -p /etc/php/7.3/fpm

RUN echo "clear_env = no" >> /etc/php/7.3/fpm/php.ini
#RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = wordpress:9000|' /etc/php/7.3/fpm/pool.d/www.conf

# Give ownership to the web server user (www-data)
RUN	chown -R root:root /var/www/wordpress

# Create the necessary directory structure for PHP configuration

# Copy your custom PHP configuration file (if needed)
#COPY conf/php.ini /etc/php/7.3/fpm/php.ini

EXPOSE 9000

RUN mkdir -p /etc/php/7.3/fpm
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY conf/auto_config.sh /auto_config.sh
#COPY conf/auto_config.sh /var/www/html/auto_config.sh
RUN chmod +x /auto_config.sh

# Define the entry point and command
ENTRYPOINT ["/bin/sh", "/auto_config.sh"]
#CMD ["php-fpm", "-F"]
#CMD ["sleep", "infinity"]
#CMD ["tail", "-f"]
