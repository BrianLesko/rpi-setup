#!/bin/bash

username=lesko

sudo apt-get update -y && sudo apt upgrade -y 

sudo apt-get install -y python3.12-pip
sudo apt-get install -y python3.12-venv
sudo apt-get install -y python3.12-dev

sudo apt-get install openssh-server -y

sudo apt-get install -y git

sudo apt remove brltty

sudo usermod -a -G video $username
sudo usermod -a -G dialout $username

# Print hostname and IP address
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"