#!/bin/bash

set -e  # exit on any error
set -u  # treat unset variables as error

# Get Minikube IP
minikube_ip=$(minikube ip)
echo "Minikube IP: $minikube_ip"

# Path to the .env file
file_to_find="../frontend/.env.docker"
echo "File to update: $file_to_find"

# Check if file exists
if [ ! -f "$file_to_find" ]; then
    echo "ERROR: File not found."
    exit 1
fi

# Current VITE_API_PATH
current_url=$(grep "^VITE_API_PATH=" "$file_to_find" || true)
echo "Current VITE_API_PATH: $current_url"

# Desired URL
new_url="VITE_API_PATH=\"http://${minikube_ip}:31100\""
echo "New VITE_API_PATH: $new_url"

# Update only if different
if [ "$current_url" != "$new_url" ]; then
    sed -i -e "s|^VITE_API_PATH=.*|$new_url|g" "$file_to_find"
    echo "Updated VITE_API_PATH."
else
    echo "No update needed. VITE_API_PATH already correct."
fi
