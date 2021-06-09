FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade 
RUN apk add vsftpd openssl openssh

RUN openssl req -x509 -nodes -days 365 \
-subj "/C=RU/ST=MOSCOW/L=MOSCOW/O=SCHOOL21/OU=21MOSCOW/CN=hsamatha" \
-newkey rsa:2048 \
-out /etc/ssl/private/vsftpd.pem \
-keyout /etc/ssl/private/vsftpd.key

RUN echo -e "hsamatha\nhsamatha\n" | adduser hsamatha

COPY ./srcs/vsftpd.conf	/etc/vsftpd/vsftpd.conf

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 	21 21000 

ENTRYPOINT ["sh", "start.sh"]
