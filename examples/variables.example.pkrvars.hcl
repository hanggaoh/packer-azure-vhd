variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Location for the resources"
  type        = string
  default     = "East US"
}

variable "image_name" {
  description = "Name of the image to be created"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the image"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the image"
  type        = string
  sensitive   = true
}