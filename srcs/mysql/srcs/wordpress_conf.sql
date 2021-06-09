
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'hsamatha'@'%' IDENTIFIED BY '1129';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'hsamatha'@'%' IDENTIFIED BY '1129' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root