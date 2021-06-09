FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade
RUN apk add wget nginx openrc supervisor \
    php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /www

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -zxvf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english /www/phpmyadmin

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/config.inc.php /www/phpmyadmin/config.inc.php

RUN chmod 755 /www/phpmyadmin
RUN chmod 755 /www/phpmyadmin/config.inc.php

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 5000

ENTRYPOINT ["sh", "start.sh"]