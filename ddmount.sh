#!/bin/sh

#Lists the disks attached to VM
lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd"
#Partition and format the disk
sudo parted /dev/sdc --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/sdc1
sudo partprobe /dev/sdc1
#Mount the disk
sudo mkdir /datadisk1
sudo mount /dev/sdc1 /datadisk1
sudo blkid
#update fstab file
vim /etc/fstab
UUID=33333333-3b3b-3c3c-3d3d-3e3e3e3e3e3e   /datadisk1   xfs   defaults,nofail   1   2
#verify the disk
lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd"
