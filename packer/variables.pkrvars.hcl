variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "azure_client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
  type        = string
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "image_name" {
  description = "Name of the image to be created"
  type        = string
  default     = "hardened-linux-image"
}

variable "image_resource_group" {
  description = "Resource group for the image"
  type        = string
}

variable "location" {
  description = "Azure region for the image"
  type        = string
  default     = "East US"
}

variable "vm_size" {
  description = "Size of the VM to be created"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}