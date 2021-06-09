FROM alpine:3.12
LABEL owner="hsamatha"

RUN apk update && apk upgrade 
RUN apk add wget libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -xvzf grafana-enterprise-7.5.4.linux-amd64.tar.gz && rm -rf grafana-enterprise-7.5.4.linux-amd64.tar.gz

ENV PATH=/grafana-7.1.3/bin:$PATH
WORKDIR /grafana-7.1.3

RUN echo -e "[security]\nadmin_user = user\nadmin_password = password" > conf/custom.ini

COPY ./srcs/dashboards.yaml conf/provisioning/dashboards/
COPY ./srcs/datasources.yaml conf/provisioning/datasources/  


COPY ./srcs/start.sh .
RUN chmod 755 start.sh

EXPOSE 3000

ENTRYPOINT ["sh", "start.sh"]