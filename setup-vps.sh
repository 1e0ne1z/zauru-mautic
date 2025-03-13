#!/bin/bash

# Install apt-utils first
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils

# Install Nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wget nginx certbot python3-certbot-nginx vim nano

# Install Docker
# Run the following command to uninstall all conflicting packages:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# To install the latest version, run:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo 'Docker successfully installed.'
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