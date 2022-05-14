#!/bin/bash -v
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
# Add Custom key to Mongo version
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# Update list packages
sudo apt-get update -y
sudo apt-get install -y mongodb-org

# Add custom mongo configuration
sudo rm -rf /etc/mongod.conf
sudo cp -rf /tmp/mongod.conf /etc/

sudo systemctl start mongod.service
