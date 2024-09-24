variable "vm_count" {
  description = "The number of VMs to create"
  type        = number
}

variable "environment" {
  description = "The environment in which the resources are being created"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "location" {
  description = "The Azure region in which the resources are being created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources are being created"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which the VMs will be placed"
  type        = string
}

variable "vm_size" {
  description = "The size of the VMs to create"
  type        = string
}

variable "admin_username" {
  description = "The username for the VMs"
  type        = string
}

variable "ssh_public_key_path" {
  description = "The path to the SSH public key to use for authentication"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the VMs"
  type        = string
}