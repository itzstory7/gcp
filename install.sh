#!/bin/bash

hostname localhost
yum install httpd sudo wget unzip -y
yum install mariadb-server -y
service mariadb start
mysql_secure_installation
yum install nano -y
cd /usr/local
wget http://89.163.132.56/assets/gcpcentos.zip
unzip gcpcentos.zip
rm -rf gcpcentos.zip
chmod -R 755 gcp

clear
echo "127.0.0.1 billing.gamecp.com billing1.gamecp.com billing2.gamecp.com
89.163.132.56" >> /etc/hosts


yum install epel-release -y
sudo yum install proftpd -y
sudo service proftpd restart

yum install lsb -y
cd ~/gcp

sh c1.sh


cd /usr/local/gcp
cd installs
mkdir -p cs && cd cs
wget http://albaneso.eu/hlds/etrail.zip
yum install unzip -y
unzip etrail.zip
rm -rf etrail.zip
cd ..
chmod -R 777 cs
cd ..
clear
./gamecp restart
cd
echo “Done”
