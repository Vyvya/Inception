FROM debian:buster

ARG NX_DOMAIN_NAME
ARG NX_USER_ADMIN_EMAIL

WORKDIR /tmp/nginx/

RUN apt-get update
RUN apt install -y nginx openssl
RUN apt install -y openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=${NX_DOMAIN_NAME}/emailAddress=${NX_USER_ADMIN_EMAIL}"

# EXPOSE 443

COPY /conf/nginx.conf /etc/nginx/conf.d

COPY /tools/nginx_script.sh .
RUN chmod +x nginx_script.sh

CMD [ "nginx", "-g", "daemon off;" ]
