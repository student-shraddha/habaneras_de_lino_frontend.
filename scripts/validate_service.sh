#!/bin/bash
# validate_service.sh

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "ValidateService: curl command not found. Exiting."
    exit 1
fi

# Example: Check if the application is running by requesting the health check endpoint
# Adjust the URL to match your application's health check endpoint
URL="http://localhost:3000/health"   # Update URL as necessary

# Timeout is set to 10 seconds
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$URL")

# Check if the response is a success code
if [[ "$RESPONSE" -ge 200 && "$RESPONSE" -lt 300 ]]; then
    echo "ValidateService: Application is running successfully. HTTP status $RESPONSE."
    exit 0
else
    echo "ValidateService: Application is not responding. Received HTTP status $RESPONSE."
    exit 1
fi
