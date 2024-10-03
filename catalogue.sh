#!/bin/bash

#Disable default nodejs version 
dnf module disable nodejs -y

#enable nodejs 18 version
dnf module enable nodejs:18 -y

#Install modejs
dnf install nodejs -y

#As our application doesnot have rpm software we have to setup manually
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
cd /app 
unzip /tmp/catalogue.zip

#download the dependencieies
cd /app
npm install

#copy the catalogue service file
cp /home/centos/robo-shell/catalogue.service /etc/systemd/system/catalogue.service

#Load the service
systemctl daemon-reload

#Enable and start service
systemctl enable catalogue
systemctl start catalogue

#copying mongodb repo
cp /home/centos/robo-shell/mongo.repo /etc/yum.repos.d/mongo.repo

#Insatlling mongodb client
dnf install mongodb-org-shell -y

#Load schema (Loading catalogue data to mongodb)
mongo --host 172.31.27.254 </app/schema/catalogue.js
