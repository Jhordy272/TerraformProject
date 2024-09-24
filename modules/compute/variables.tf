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

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_D16plds_v5"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the public SSH key"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to place the VM in"
  type        = string
}

variable "vm_role" {
  description = "Role of the VM (e.g., frontend, backend)"
  type        = string
}
