#!/bin/bash

#Configure Elasticsearch
CLUSTER_NAME=$1
HOSTIP=`hostname -i | awk '{print $2}'`
HOSTNAME=`hostname`
DATA_PATH="/datadisc/elasticsearch"
DATA_PATH_DEFAULT="/var/lib/elasticsearch"
mv /var/lib/elasticsearch /datadisc
sudo sed -i "s/#cluster.name: my-application/cluster.name: $CLUSTER_NAME/g" /etc/elasticsearch/elasticsearch.yml
sudo sed -i "s/#node.name: node-1/node.name: $HOSTNAME/g" /etc/elasticsearch/elasticsearch.yml
sudo sed -i "s/#bootstrap.memory_lock: true/bootstrap.memory_lock: true/g" /etc/elasticsearch/elasticsearch.yml
sudo sed -i "s/#network.host: 192.168.0.1/network.host: $HOSTIP/g" /etc/elasticsearch/elasticsearch.yml
# echo "discovery.zen.minimum_master_nodes: 2" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
echo "bootstrap.system_call_filter: false" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
# echo "node.data: true" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
# echo "node.master: true" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
sudo sed -i "s/-Xms1g/-Xms4g/g" /etc/elasticsearch/jvm.options
sudo sed -i "s/-Xmx1g/-Xmx4g/g" /etc/elasticsearch/jvm.options
# echo "discovery.zen.ping.unicast.hosts:" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
# echo "        - $NODE1IP" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
# echo "        - $NODE2IP" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
# echo "        - $NODE3IP" | sudo tee -a /etc/elasticsearch/elasticsearch.yml 
sudo sed -i "s/path.data: \/var\/lib\/elasticsearch/path.data: \/datadisc\/elasticsearch/g" /etc/elasticsearch/elasticsearch.yml
sudo mkdir /etc/systemd/system/elasticsearch.service.d
echo "[Service]" >> /etc/systemd/system/elasticsearch.service.d/override.conf
echo "LimitMEMLOCK=infinity" >> /etc/systemd/system/elasticsearch.service.d/override.conf
