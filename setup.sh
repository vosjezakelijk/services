#!/bin/bash

#clean previous
minikube stop
minikube delete

#start, define vm and params
minikube start --vm-driver=virtualbox --disk-size=5000MB --memory=2000mb

#use docker's daemon from minikube!
eval $(minikube docker-env)

#activate addons
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

#build pods images
docker build -t wordpress_image srcs/wordpress
docker build -t nginx_image srcs/nginx 
docker build -t phpmyadmin_image srcs/phpmyadmin
docker build -t mysql_image srcs/mysql
docker build -t ftps_image srcs/ftps
docker build -t influxdb_image srcs/influxdb
docker build -t grafana_image srcs/grafana
docker build -t telegraf_image srcs/telegraf 

#deploy
kubectl apply -f ./srcs/metallb-config.yaml
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/ftps.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/grafana.yaml
kubectl apply -f ./srcs/telegraf.yaml

#open dash
minikube dashboard