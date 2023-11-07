FROM debian:buster

ARG WDB_HOST
ARG WDB_NAME
ARG WDB_USER
ARG WDB_PASSWORD

RUN apt-get update
RUN apt-get -y install vim curl iputils-ping php7.3 php-mysql php-fpm mariadb-client

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chown www-data:www-data wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# RUN chown -R www-data:www-data /var/www/wordpress
# RUN chmod 755 /var/www/wordpress

WORKDIR /var/www/wordpress
# RUN rm -f /var/www/wordpress/wp-config.php
RUN wp core download --allow-root
RUN wp config create --dbhost=${WDB_HOST} --dbname=${WDB_NAME} --dbuser=${WDB_USER} --dbpass=${WDB_PASSWORD} --skip-check --allow-root

ENTRYPOINT ["/tmp/auto_config.sh"]
