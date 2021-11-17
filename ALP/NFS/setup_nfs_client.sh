#!/bin/bash

yum install nfs-utils -y
mkdir /mnt/nfs_share
echo "10.0.0.41:/var/nfs_share /mnt/nfs_share nfs nfsvers=3,proto=udp 0 0" >> /etc/fstab
mount -a