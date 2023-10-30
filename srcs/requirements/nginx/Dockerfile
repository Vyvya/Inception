FROM debian:buster

RUN apt-get update && apt install -y nginx vim curl net-tools openssl -y
RUN apt-get install apt-transport-https -y

RUN mkdir -p /etc/nginx/ssl

#RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
#	-keyout /etc/nginx/ssl/inception.key \
#	-subj "/C=FR/ST=Lausanne/L=Lausanne/O=42/OU=42/CN=vgejno.42.fr/UID=vgejno"

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/nginx-selfsigned.crt \
		-keyout /etc/nginx/ssl/nginx-selfsigned.key \
		-subj "/C=FR/ST=Lausanne/L=Lausanne/O=42/OU=42/CN=vgejno/UID=vgejno"

#RUN mkdir -p /var/run/nginx
# RUN mkdir -p run/nginx
# 
COPY /conf/nginx.conf /etc/nginx/nginx.conf
# COPY /conf/ssl_self_signed.conf /etc/nginx/ssl_conf/ssl_self_signed.conf
# COPY /conf/ssl_params.conf /etc/nginx/ssl_conf/ssl_params.conf

COPY /tools/nginx_script.sh /
RUN chmod +x /nginx_script.sh /

# RUN chmod 777 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT [ "/nginx_script.sh" ]

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

#WORKDIR

#COPY . .

#RUN --mount=type=ssh ....
#RUN --network=host


#VOLUME []

#ENTRYPOINT [ "executable" ]