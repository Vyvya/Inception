FROM debian:buster

RUN apt-get update
RUN apt-get -y install wget curl php7.3 php-mysql php-fpm  mariadb-client

WORKDIR /var/www/wordpress
RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/ \
    && cd /var/www/ && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN rm -f /var/www/wordpress/wp-config-sample.php

COPY ./conf/auto_config.sh /
RUN chmod 777 /auto_config.sh

EXPOSE 9000

CMD ["/auto_config.sh"]

#     php php-fpm php-mysql php-phar \
#     php-json php-xml php-mbstring \
#     php-curl php-gd php-intl php-zip \
#    

# # Set the working directory
# WORKDIR /var/www/html

# # Ensure the directory is owned by the web server user (www-data)
# RUN chown -R www-data:www-data /var/www/
# RUN chmod -R 755 /var/www/html/

# #WP-CLI is the command-line interface for WordPress. You can update plugins, 
# #configure multisite installations and much more, without using a web browser
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# #RUN cp conf/wp-config.php /var/www/html/wp-config.php

# # Give ownership to the web server user (www-data)
# RUN	chown -R www-data:www-data /var/www/html

# EXPOSE 9000

# # RUN chmod +x /run/
# RUN mkdir -p /run/php
# COPY ./conf/www.conf /etc/php/fpm/pool.d/www.conf

# COPY ./conf/auto_config.sh /usr/local/bin/auto_config.sh
# RUN chmod 777 /usr/local/bin/auto_config.sh
# # COPY ./tools/wp_my_config.php /var/www/html/wp-config.php

# CMD ["/bin/sh", "/usr/local/bin/auto_config.sh"]

# # CMD ["php-fpm", "-F"]