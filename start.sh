#!/bin/bash

username=lesko
email=my_email

sudo apt-get update -y && sudo apt upgrade -y 

sudo apt-get install -y python3.12-pip
sudo apt-get install -y python3.12-venv
sudo apt-get install -y python3.12-dev

sudo apt-get install openssh-server -y

sudo apt-get install -y git

sudo apt remove brltty -y
sudo apt thunderbird -y

sudo usermod -a -G video $username
sudo usermod -a -G dialout $username

# Print hostname and IP address
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"

# ssh keygen for github access, generate the key on your pi 
ssh-keygen -t ed25519 -C $username

# copy the key to github ssh keys 

# copy the key to your personal machine 
ssh-copy-id -i ~/.ssh/id_rsa.pub $username@remote-host

# also install docker 
# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $username
newgrp docker

# clone common repositories
# clone the reverse proxy server
git clone https://github.com/BrianLesko/reverse-proxy-nginx-docker
# clone the dns server 
git clone https://github.com/BrianLesko/dns-docker

# setup secrets and test running each code

# setup crontab jobs to automatically start @reboot

# print running containers
docker ps