#!/bin/bash

set -e
set -u

# Get Minikube IP
minikube_ip=$(minikube ip)
echo "Minikube IP: $minikube_ip"

# Path to the .env file
file_to_find="../backend/.env.docker"
echo "File to update: $file_to_find"

# Check if file exists
if [ ! -f "$file_to_find" ]; then
    echo "ERROR: File not found."
    exit 1
fi

# Current FRONTEND_URL (line 4)
current_url=$(sed -n '4p' "$file_to_find" || true)
echo "Current FRONTEND_URL: $current_url"

# Desired URL
new_url="FRONTEND_URL=\"http://${minikube_ip}:5173\""
echo "New FRONTEND_URL: $new_url"

# Update only if different
if [ "$current_url" != "$new_url" ]; then
    sed -i -e "4s|.*|$new_url|" "$file_to_find"
    echo "Updated FRONTEND_URL."
else
    echo "No update needed. FRONTEND_URL already correct."
fi
