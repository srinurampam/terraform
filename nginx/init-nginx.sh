#!/bin/bash
apt update -y
apt install nginx -y
systemctl start nginx
echo "nginx webserver" > /var/www/html/index.html