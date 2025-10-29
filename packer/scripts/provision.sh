#!/bin/bash

# Update package list and install necessary packages
apt-get update
apt-get install -y \
    curl \
    wget \
    git \
    vim \
    htop \
    net-tools \
    build-essential \
    linux-headers-$(uname -r)

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Additional configuration can be added here
# For example, setting up users, configuring SSH, etc.