FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade
RUN apk add libc6-compat

RUN mkdir /srcs
WORKDIR /srcs

RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.2_linux_amd64.tar.gz
RUN tar -xvfz telegraf-1.16.2_linux_amd64.tar.gz && rm -rf telegraf-1.16.2_linux_amd64.tar.gz 

WORKDIR /srcs/telegraf-1.16.2
COPY ./srcs/telegraf.conf  ./etc/telegraf
RUN ln -s $(pwd)/etc/telegraf  /etc/telegraf
RUN ln -s $(pwd)/usr/bin/telegraf  /bin/telegraf

COPY ./srcs/start.sh .
RUN chmod -R 755 start.sh

ENTRYPOINT 	["sh", "start.sh"]
