FROM debian:buster

RUN ping WP_DB_HOST

ARG WP_DB_HOST
ARG WP_DB_NAME
ARG WP_DB_USER
ARG WP_DB_PASSWORD

RUN apt-get update
RUN apt-get -y install vim curl php7.3 php-mysql php-fpm mariadb-client

# RUN mkdir -p /var/www/wordpress
# RUN chown -R root:root /var/www/wordpress
# RUN chmod 755 /var/www/wordpress

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/php7.3-fpm/pool.d/www.conf


COPY ./tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chown root:root wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
RUN chown -R root:root /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN wp core download --allow-root
RUN wp config create --dbhost=${WP_DB_HOST} --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASSWORD} --allow-root


ENTRYPOINT ["/tmp/auto_config.sh"]

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