#!/bin/bash

# Cleanup script for Packer builds
# This script removes temporary files and configurations to ensure a clean final image.

# Remove temporary files
rm -rf /tmp/*

# Clean up package manager cache
apt-get clean

# Remove any logs
find /var/log -type f -exec rm -f {} \;

# Optionally, remove SSH host keys to ensure a new set is generated on first boot
rm -f /etc/ssh/ssh_host_*_key*

# Exit successfully
exit 0