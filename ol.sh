#!/bin/sh

 

# 1)    Java –1.8
# 2)    Maven-- version: "3.10.0-862.el7.x86_64"
# 3)    Docker-- Docker version 18.03.1-ce, build 9ee9f40
# 4)    Python -- Python 2.7.5
# 5)    JQ -- jq-1.6

 


# ====================Install jq 1.6 ===================="

 

sudo wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
sudo chmod +x ./jq
sudo cp jq /usr/bin
echo "----------jq installed version---------" >> /var/log/script-install.log
jq --version >> /var/log/script-install.log

 

# ====================Install Java 1.8.0_262===================="

 

sudo yum install java-1.8.0-openjdk -y
sudo yum install java-1.8.0-openjdk-devel -y
echo "--------Java installed version-------" >> /var/log/script-install.log
java -version >> /var/log/script-install.log

 

# ====================Install Maven 3.5.2===================="

 

wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
echo "----------maven installed version 3.5.2---------" >> /var/log/script-install.log
mvn -version >> /var/log/script-install.log

 


# ====================Install Python2.7.5 ===================="
sudo yum install -y oracle-epel-release-el7
sudo yum install -y python2
echo "----------python version---------" >> /var/log/script-install.log
python --version >> /var/log/script-install.log

 


# ====================Install Docker CE 19.03.12, build 48a66213fe ===================="

 

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io  
systemctl start docker
systemctl enable docker
echo "----------Docker version Installed---------" >> /var/log/script-install.log
docker --version >> /var/log/script-install.log
