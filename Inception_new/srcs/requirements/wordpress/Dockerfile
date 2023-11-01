FROM debian:buster

RUN apt-get update
RUN apt-get -y install wget curl php7.3 php-mysql php-fpm  mariadb-client

# WORKDIR /var/www/wordpress
RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/
RUN cd /var/www/ && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN rm -f /var/www/wordpress/wp-config-sample.php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


COPY ./conf/auto_config.sh ./var/www/wordpress/
# RUN chmod 777 /auto_config.sh

CMD ["/auto_config.sh"]
