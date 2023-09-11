#!/bin/bash
sudo dnf update -y
sudo dnf install httpd mod_ssl php php-mysqlnd -y
sudo systemctl start httpd
sudo systemctl status httpd
sudo systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html