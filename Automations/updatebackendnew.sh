#!/bin/bash

# Get Minikube IP 
minikube_ip=$(minikube ip)

# Path to the .env file
file_to_find="../frontend/.env.docker"

# Check the current VITE_API_PATH in the .env file
current_url=$(cat $file_to_find)

# Update the .env file if the IP address has changed
if [[ "$current_url" != "VITE_API_PATH=\"http://${minikube_ip}:31100\"" ]]; then
    if [ -f $file_to_find ]; then
        sed -i -e "s|VITE_API_PATH.*|VITE_API_PATH=\"http://${minikube_ip}:31100\"|g" $file_to_find
    else
        echo "ERROR: File not found."
    fi
fi
