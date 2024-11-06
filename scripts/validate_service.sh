#!/bin/bash
# validate_service.sh

# Example: Check if the application is running by requesting the home page
# Adjust the URL to match your application's health check endpoint
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000)

if [ "$RESPONSE" -eq 200 ]; then
  echo "ValidateService: Application is running successfully."
  exit 0
else
  echo "ValidateService: Application is not responding. Received HTTP status $RESPONSE."
  exit 1
fi
