#!/bin/bash

# Validate the built image in Azure

# Set variables
RESOURCE_GROUP="your-resource-group"
IMAGE_NAME="your-image-name"
LOCATION="your-location"

# Check if the image exists
if az image show --name $IMAGE_NAME --resource-group $RESOURCE_GROUP &> /dev/null; then
    echo "Image $IMAGE_NAME exists in resource group $RESOURCE_GROUP."
else
    echo "Image $IMAGE_NAME does not exist in resource group $RESOURCE_GROUP."
    exit 1
fi

# Validate the image properties
IMAGE_PROPERTIES=$(az image show --name $IMAGE_NAME --resource-group $RESOURCE_GROUP --query "storageProfile" -o json)

# Check for required properties
if [[ $(echo $IMAGE_PROPERTIES | jq -r '.osDisk.osType') == "Linux" ]]; then
    echo "Image $IMAGE_NAME is a valid Linux image."
else
    echo "Image $IMAGE_NAME is not a valid Linux image."
    exit 1
fi

# Additional validation checks can be added here

echo "Image validation completed successfully."