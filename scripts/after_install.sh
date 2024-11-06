#!/bin/bash
# after_install.sh

# Example: Set permissions for the application files
sudo chmod -R 755 /home/ec2-user/habaneras_de_lino_frontend

# Example: Install any additional dependencies
cd /home/ec2-user/app || exit
npm install --production  # if you're using Node.js

echo "AfterInstall script executed successfully."
