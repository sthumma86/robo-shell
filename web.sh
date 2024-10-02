#!/bin/bash
#Installing and enablling nginx
dnf install nginx -y
systemctl enable nginx
systemctl start nginx

#Delete the default config
rm -rf /usr/share/nginx/html/*

#Download the content
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

#unzip the content
cd /usr/share/nginx/html
unzip /tmp/web.zip

#copy the reverse proxy file
cp /home/centos/robo-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf

#Restart nginx
systemctl restart nginx