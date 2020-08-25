#!/bin/sh

# ====================Install Java===================="
sudo apt update -y
sudo apt install openjdk-8-jre-headless -y
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# ====================Install elasticsearch===================="

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update -y
sudo apt-get install elasticsearch
sudo systemctl start elasticsearch.service
exit 0
