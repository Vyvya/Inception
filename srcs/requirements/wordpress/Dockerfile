FROM debian:bullseye

# Install required packages
RUN apt update && apt upgrade -y \
	&& apt-get -y install wget php7.3 php-fpm php-mysql mariadb-client

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www \
    && cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

#WP-CLI is the command-line interface for WordPress. You can update plugins, 
#configure multisite installations and much more, without using a web browser
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
#RUN sudo mv wp-cli.phar /usr/local/bin/wp
RUN mv wp-cli.phar /usr/local/bin/wp
#RUN cp conf/wp-config.php /var/www/html/wp-config.php

# Create the directory if it doesn't exist
RUN mkdir -p /etc/php/7.3/fpm

RUN echo "clear_env = no" >> /etc/php/7.3/fpm/php.ini
#RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = wordpress:9000|' /etc/php/7.3/fpm/pool.d/www.conf

# Give ownership to the web server user (www-data)
RUN		chown -R root:root /var/www/wordpress

# Create the necessary directory structure for PHP configuration
RUN mkdir -p /etc/php/7.3/fpm

# Copy your custom PHP configuration file (if needed)
#COPY conf/php.ini /etc/php/7.3/fpm/php.ini

# Set the working directory
WORKDIR /var/www/html

COPY conf/auto_config.sh /var/www/html/auto_config.sh
# Define the entry point and command
ENTRYPOINT ["auto_config.sh"]
CMD ["php-fpm"]
#CMD ["tail", "-f"]
