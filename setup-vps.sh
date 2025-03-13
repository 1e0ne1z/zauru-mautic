#!/bin/bash

# Install apt-utils first
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils

# Install Nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y nginx certbot python3-certbot-nginx vim nano

# Install Docker
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker.io docker-compose

# Install Git
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Fix docker.sock permissions
sudo chmod 666 /var/run/docker.sock

# Restart Docker service
sudo systemctl restart docker

# Force group changes to take effect without logout
exec sudo su -l ubuntu