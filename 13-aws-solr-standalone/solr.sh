#!/bin/bash -v

# Update list packages and install java
sudo apt-get update -y
sudo apt-get install openjdk-11-jdk -y


# download  solr
cd /tmp
wget https://archive.apache.org/dist/lucene/solr/8.6.0/solr-8.6.0.tgz
 
sudo cp -rf  solr-8.6.0.tgz /opt

# install tgz
cd /opt/
sudo tar -xvzf solr-8.6.0.tgz
sudo rm -rf solr-8.6.0/bin/install_solr_service.sh
sudo cp -rf /tmp/install_solr_service.sh solr-8.6.0/bin/
echo y | sudo  bash solr-8.6.0/bin/install_solr_service.sh solr-8.6.0.tgz


exit;
