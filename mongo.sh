#!/bin/bash

#copy mogoDB repo file 
cp mongo.repo /etc/yum.repos.d/mongo.repo

#Install mongodb
dnf install mongodb-org -y 

#Enable and Restart MongoDB
systemctl enable mongod
systemctl start mongod

#edit the configuration file to allow all IP address
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

#Restart mongod service
systemctl restart mongod
