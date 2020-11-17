#!/bin/sh

PARTED=$1

#Lists the disks attached to VM
lsblk >> /tmp/datadisklog.txt

#Partition and format the disk
sudo parted /dev/${PARTED} --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/${PARTED}1
sudo partprobe /dev/${PARTED}1

#Mount the disk
sudo mkdir /datadisk1
sudo mount /dev/${PARTED}1 /datadisk1

#update fstab file
echo "UUID=$(blkid -o value -s UUID /dev/${PARTED}1)   /datadisk1   xfs   defaults,nofail   1   2" >> /etc/fstab

echo "datadisk is mounted successfully" >> /tmp/datadisklog.txt
lsblk >> /tmp/datadisklog.txt
