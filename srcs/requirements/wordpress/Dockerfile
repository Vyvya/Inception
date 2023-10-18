FROM debian:bullseye

RUN apt update && apt upgrade -y

#installer WordPress avec son lien de téléchargement
RUN apt-get -y install wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www