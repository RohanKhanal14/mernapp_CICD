#!/bin/bash

# Get Minikube IP instead of EC2 instance IP
minikube_ip=$(minikube ip)

# Path to the .env file
file_to_find="../backend/.env.docker"

# Check the current FRONTEND_URL in the .env file (line 4)
current_url=$(sed -n "4p" $file_to_find)

# Update the .env file if the IP address has changed
if [[ "$current_url" != "FRONTEND_URL=\"http://${minikube_ip}:5173\"" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|FRONTEND_URL.*|FRONTEND_URL=\"http://${minikube_ip}:5173\"|g" $file_to_find
        echo "Updated FRONTEND_URL to http://${minikube_ip}:5173"
    else
        echo "ERROR: File not found."
    fi
else
    echo "No update needed. FRONTEND_URL already points to Minikube."
fi
