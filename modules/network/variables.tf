variable "environment" {
  description = "Environment name (e.g., qa, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
}

variable "frontend_subnet_prefix" {
  description = "Address prefix for the frontend subnet"
  type        = string
}

variable "backend_subnet_prefix" {
  description = "Address prefix for the backend subnet"
  type        = string
}

variable "database_subnet_prefix" {
  description = "Address prefix for the database subnet"
  type        = string
}

variable "bastion_subnet_prefix" {
  description = "Address prefix for the Azure Bastion subnet"
  type        = string
}