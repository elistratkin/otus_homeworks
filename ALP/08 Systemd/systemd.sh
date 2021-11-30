#!/bin/bash

echo "Copy watchlog service files"
cp /vagrant/watchlog /etc/sysconfig/watchlog
cp /vagrant/watchlog.sh /opt/watchlog.sh
chmod +x /opt/watchlog.sh
cp /vagrant/watchlog.service /etc/systemd/system/watchlog.service
cp /vagrant/watchlog.timer /etc/systemd/system/watchlog.timer
cat >> /var/log/watchlog.log << EOF
Hello world
World hello
ALERT
Hello hello
World world
EOF
echo "Start watchlog service"
systemctl enable watchlog.timer --now


echo "Install spawn-fcgi and depends"
yum install epel-release -y && yum install spawn-fcgi php php-cli mod_fcgid httpd -y
echo "Configure spawn-fcgi"
cp /vagrant/spawn-fcgi /etc/sysconfig/spawn-fcgi
cp /vagrant/spawn-fcgi.service /etc/systemd/system/spawn-fcgi.service
echo "Start spawn-fcgi"
systemctl start spawn-fcgi

echo "Copy httpd service file"
cp /vagrant/httpd.service /etc/systemd/system/httpd.service
echo "Configure httpd service conf"
cat >> /etc/sysconfig/httpd-first << EOF 
OPTIONS=-f conf/httpd-first.conf
EOF
cat >> /etc/sysconfig/httpd-second << EOF 
OPTIONS=-f conf/httpd-second.conf
EOF
echo "Configure httpd conf"
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/second.conf
sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/second.conf
echo "PidFile /var/run/httpd-second.pid" >> /etc/httpd/conf/second.conf
echo "Start httpd service"
systemctl daemon-reload
systemctl enable --now httpd@first
systemctl enable --now httpd@second