#!/bin/bash

# Install Nginx
sudo apt-get update
sudo apt-get install -y nginx certbot python3-certbot-nginx vim nano

# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io docker-compose

# Install Git
sudo apt-get install -y git

sudo groupadd docker
sudo usermod -aG docker ubuntu