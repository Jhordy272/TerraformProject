# Purpose: Define input variables for the database module

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
  default = "japaneast"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "MySQL admin username"
  type        = string
}

variable "admin_password" {
  description = "MySQL admin password"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU name for MySQL server"
  type        = string
  default     = "GP_Standard_D2ds_v4"  # This is a basic tier, single core instance
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 5120  # 5GB, minimum for Basic tier
}

variable "mysql_version" {
  description = "MySQL version"
  type        = string
  default     = "5.7"
}

variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to allow access from"
  type        = string
}

variable "zone" {
  description = "Availability zone for MySQL server (if applicable)"
  type        = string
  default     = "1"  # Cambia este valor según tus necesidades
}

