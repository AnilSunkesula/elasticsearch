#!/bin/sh

# ====================Install Java===================="
sudo apt update -y
sudo apt install openjdk-8-jre-headless -y
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# ====================Install elasticsearch===================="

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.deb.sha512
shasum -a 512 -c elasticsearch-6.3.2.deb.sha512
sudo dpkg -i elasticsearch-6.3.2.deb
sudo systemctl start elasticsearch.service
exit 0
