#! /bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo service httpd start
echo -e "\e[31mWELCOMEMOMIN]"