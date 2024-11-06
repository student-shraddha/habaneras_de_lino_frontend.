#!/bin/bash
# application_stop.sh

# Example: Stop the application
# Adjust this to terminate any running process that needs to be stopped before redeployment
pkill -f "node"  # For a Node.js app; modify as needed for other stacks

echo "ApplicationStop script executed successfully."
