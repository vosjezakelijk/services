FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client

COPY ./srcs/wordpress_conf.sql .
COPY ./srcs/wordpress.sql .
COPY ./srcs/wp.cnf /etc/wp.cnf

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

RUN chmod 755 /var/lib/mysql/
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["sh", "start.sh"]
