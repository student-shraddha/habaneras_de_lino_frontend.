#!/bin/bash
# before_install.sh

# Update packages
sudo yum update -y

# Install Node.js and npm
sudo yum install -y nodejs npm

# Ensure the application directory exists
mkdir -p /home/ec2-user/app
cd /home/ec2-user/app || exit

# Install necessary dependencies if package.json exists
if [ -f "package.json" ]; then
  npm install
fi

echo "BeforeInstall script executed successfully."
