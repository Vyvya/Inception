FROM debian:buster

ARG WP_DB_HOST
ARG WP_DB_NAME
ARG WP_DB_USER
ARG WP_DB_PASSWORD

# ENV DB_HOST=$WP_DB_HOST
# ENV DB_NAME=$WP_DB_NAME
# ENV DB_USER=$WP_DB_USER
# ENV DB_PASSWORD=$WP_DB_PASSWORD

RUN apt-get update
RUN apt-get -y install vim curl iputils-ping php7.3 php-mysql php-fpm mariadb-client

# RUN mkdir -p /var/www/wordpress
# RUN chown -R root:root /var/www/wordpress
# RUN chmod 755 /var/www/wordpress

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf


COPY ./tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chown www-data:www-data wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod 755 /var/www/wordpress

ENTRYPOINT ["/tmp/auto_config.sh"]
# CMD ["/usr/sbin/php-fpm7.3", "-F"]

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN chown root:root wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# RUN cd /var/www/wordpress

# RUN /bin/ls
# # RUN wp-cli.phar cli update --allow-root
# RUN wp core download --allow-root

# COPY ./tools/test.sh /tmp/test.sh
# RUN chmod +x /tmp/test.sh
# CMD ["/tmp/test.sh"]