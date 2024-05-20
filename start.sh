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



