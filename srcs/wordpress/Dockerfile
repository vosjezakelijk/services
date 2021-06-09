FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade 
RUN apk add wget nginx openssl openrc openssh \
supervisor php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN mv wordpress /www/

RUN adduser -D -g 'www' www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/wp-config.php /www/wordpress/
COPY ./srcs/supervisord.conf /etc/supervisord.conf

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 5050

ENTRYPOINT ["sh", "start.sh"]