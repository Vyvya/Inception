FROM debian:bullseye

RUN apt update && apt upgrade -y

#installer WordPress avec son lien de téléchargement
RUN apt-get -y install wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www

#go into /var/www untar and delete .tar
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#give rights to root
RUN		chown -R root:root /var/www/wordpress