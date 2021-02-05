#!/usr/bin/env bash
echo "Hello from backend!"

#Set PORT enviroment variable
sudo echo "export PORT=4001" >/home/vagrant/.bashrc
source /home/vagrant/.bashrc
sudo echo "export PORT=4001" >> /etc/profile.d/sh.local
source /etc/profile.d/sh.local

cd /shared
sudo nohup ./vuego-demoapp &