#!/usr/bin/env bash
echo "Hello world!"

sudo yum clean all
sudo rm -rf /var/cache/yum/*

# Install Git
sudo yum install -y git

# Install node and npm 
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install -y nodejs

sudo npm install -g @vue/cli


cd /home/vagrant

# download an install Go
sudo curl -O -L "https://golang.org/dl/go1.15.7.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz
if [ -d "/home/vagrant/go"]; then
    sudo mv go /usr/local
fi
sudo echo "export PATH=$PATH:/usr/local/go/bin" > /etc/profile.d/sh.local
sudo echo "export PORT=4001" >> /etc/profile.d/sh.local
source /etc/profile.d/sh.local

#Downnload got repo
sudo git clone https://github.com/benc-uk/vuego-demoapp.git /home/vagrant/vuego-demoapp


cd /home/vagrant/vuego-demoapp/server
go build 
mv vuego-demoapp /shared


echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' > /home/vagrant/vuego-demoapp/spa/.env.production.local
cd /home/vagrant/vuego-demoapp/spa
sudo npm install
sudo npm run build
tar -czf dist.tar.gz dist && mv dist.tar.gz /shared

node --version
npm --version
go version
echo "Trabajo Realizado sr Stark"



