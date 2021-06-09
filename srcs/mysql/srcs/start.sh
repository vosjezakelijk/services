#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -u root mysql < wordpress_conf.sql
mysql -u root wordpress < wordpress.sql

rc-service mariadb stop

/usr/bin/mysqld_safe