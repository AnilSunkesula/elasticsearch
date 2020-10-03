#!/bin/sh

# ====================Install Java 1.8.0_262===================="

sudo yum install java-1.8.0-openjdk -y
sudo yum install java-1.8.0-openjdk-devel -y


# ====================Install Elasticsearch===================="

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.2-x86_64.rpm
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.9.2-x86_64.rpm.sha512
shasum -a 512 -c elasticsearch-7.9.2-x86_64.rpm.sha512 
sudo rpm --install elasticsearch-7.9.2-x86_64.rpm
