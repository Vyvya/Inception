FROM debian:buster

RUN apt-get update
RUN apt-get -y install vim wget php7.3 php-mysql php-fpm mariadb-client

# RUN mkdir -p /var/www/wordpress
# RUN chown -R root:root /var/www/wordpress
# RUN chmod 755 /var/www/wordpress

RUN mkdir -p /run/php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chown root:root wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp-cli.phar

WORKDIR /var/www/wordpress
# RUN wp-cli.phar cli update --allow-root
RUN wp-cli.phar core download --allow-root

COPY ./tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

ENTRYPOINT ["/tmp/auto_config.sh"]
