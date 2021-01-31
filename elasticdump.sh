#!/bin/sh

wget http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz
tar xvf node-v0.10.22-linux-x64.tar.gz
export NODE_HOME=/home/node-v0.10.0-linux-x64
export PATH=$PATH:$NODE_HOME/bin
export NODE_PATH=$NODE_HOME/lib/node_modules
source /etc/profile
node -v 
curl -L https://npmjs.org/install.sh | sh
npm install elasticdump -g
elasticdump
