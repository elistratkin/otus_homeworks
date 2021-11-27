#!/bin/bash

yum install nfs-utils firewalld -y
mkdir /var/nfs_share
chmod ugo+rw /var/nfs_share/
mkdir /var/nfs_share/upload
chmod ugo+rw /var/nfs_share/upload
echo "/var/nfs_share/ *(rw)" >> /etc/exports
sed -i "36s/# port=0/port=20048/" /etc/nfs.conf
sed -i "s/# tcp/udp/" /etc/nfs.conf
systemctl enable nfs-server
systemctl start nfs-server

systemctl enable firewalld --now
systemctl start firewalld
firewall-cmd --new-zone=memcached --permanent
firewall-cmd --zone=memcached --add-port=111/udp --permanent
firewall-cmd --zone=memcached --add-port=2049/udp --permanent
firewall-cmd --zone=memcached --add-port=20048/udp --permanent
firewall-cmd --zone=memcached --add-source=10.0.0.40/32 --permanent
firewall-cmd --reload
