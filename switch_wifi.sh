#!/bin/bash

# Get the current username and hostname
USER=$(whoami)
HOSTNAME=$(hostname)

# Print the SSH command
echo "After switching networks, connect with : ssh $USER@$HOSTNAME.local"

# Prompt for SSID and password if not provided as arguments
SSID="${1:-}"
PASSWORD="${2:-}"

if [[ -z "$SSID" ]]; then
    read -p "Enter WiFi SSID: " SSID
fi

if [[ -z "$PASSWORD" ]]; then
    read -s -p "Enter WiFi password: " PASSWORD
    echo
fi

# Connect to the specified WiFi network
sudo nmcli device wifi connect "$SSID" password "$PASSWORD" ifname wlan0

# Request an IP address via DHCP
sudo dhclient wlan0

# Print the current IP address
echo "Current IP address:"
hostname -I
