#!/bin/bash
# before_install.sh

# Update and install necessary dependencies
sudo yum update -y
sudo yum install -y nodejs npm

# Navigate to the application directory and install dependencies
cd /home/ec2-user/app || exit
npm install
