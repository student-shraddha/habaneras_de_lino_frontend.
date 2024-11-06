#!/bin/bash
# application_start.sh

# Example: Start the application
# Adjust this command to match how you run your application
cd /home/ec2-user/app || exit
nohup npm start &  # For a Node.js app; modify as needed for other stacks

echo "ApplicationStart script executed successfully."
