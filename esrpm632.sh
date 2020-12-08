#!/bin/sh

# ====================Install Java 1.8.0_262===================="

sudo yum install java-1.8.0-openjdk -y
# sudo yum install java-1.8.0-openjdk-devel -y


# ====================Install Elasticsearch===================="

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.rpm.sha512
yum install -y perl-Digest-SHA
shasum -a 512 -c elasticsearch-6.3.2.rpm.sha512
sudo rpm --install elasticsearch-6.3.2.rpm
sudo systemctl start elasticsearch.service

exit 0
