FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade 
RUN apk add influxdb

COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 8086

ENTRYPOINT ["sh", "start.sh"]