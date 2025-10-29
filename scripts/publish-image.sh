#!/bin/bash

# This script publishes the built image to Azure after validation.

# Variables
RESOURCE_GROUP="your-resource-group"
IMAGE_NAME="your-image-name"
LOCATION="your-location"

# Publish the image to Azure
az image create --resource-group $RESOURCE_GROUP --name $IMAGE_NAME --source <source-image-id> --location $LOCATION

# Check if the image was published successfully
if [ $? -eq 0 ]; then
    echo "Image published successfully: $IMAGE_NAME"
else
    echo "Failed to publish the image."
    exit 1
fi