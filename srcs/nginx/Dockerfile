FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade
RUN apk add nginx openssl openrc openssh supervisor

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs/nginx.conf /etc/nginx/conf.d/nginx.conf

RUN	mkdir /etc/nginx/ssl
RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 \
-subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=SCHOOL21/OU=21MOSCOW/CN=hsamatha" \
-newkey rsa:2048 \
-out /etc/nginx/ssl/cert.pem \
-keyout /etc/nginx/ssl/key.key

RUN echo -e "password\npassword\n" | adduser user

COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/index.html /var/www/nginx/index.html

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 80 443 22

ENTRYPOINT ["sh", "start.sh"]