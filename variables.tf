variable "storage_account_name" {
    description = "Name of the storage account"
    type        = string
    default     = "finaltaskepam844"
}

variable "storage_account_container_name" {
    description = "Name of the storage account container"
    type        = string
    default     = "tfstate"
}

variable "project_name" {
    description = "Name of the project"
    type        = string
    #default = "FinalTaskEPAM"
}

variable "location" {
    description = "Location"
    type        = string
    #default     = "East US"
}

#Variables for the frontend module
variable "frontend_vm_count" {
    description = "Number of frontend VMs to create"
    type        = number
    default     = 1
}

variable "frontend_vm_size" {
    description = "Size of the frontend VM"
    type        = string
    default     = "Standard_B1s"
}

#Variables for the backend module
variable "backend_vm_count" {
    description = "Number of backend VMs to create"
    type        = number
    default     = 1
}

variable "backend_vm_size" {
    description = "Size of the backend VM"
    type        = string
    default     = "Standard_B1s"
}

#Variables for the backend module
variable "bastion_vm_count" {
    description = "Number of backend VMs to create"
    type        = number
    default     = 1
}

variable "bastion_vm_size" {
    description = "Size of the backend VM"
    type        = string
    default     = "Standard_B1s"
}

variable "vm_admin_username" {
    description = "Admin username for the VM"
    type        = string
    #default     = "jhordy"
}

variable "ssh_public_key_path" {
    description = "Path to the public SSH key"
    type        = string
    #default     = "~/.ssh/id_rsa.pub"
}

#Variables for the database module

variable "db_admin_username" {
    description = "MySQL admin username"
    type        = string
    #default = "jhordy"
}

variable "db_admin_password" {
    description = "MySQL admin password"
    type        = string
    #default = "Password1234"
    sensitive = true
}

variable "db_name" {    
    description = "Name of the database to create"
    type        = string
    #default     = "finaltaskepamdb"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = string
  #default     = "10.0.0.0/16"
}

variable "frontend_subnet_prefix" {
  description = "Address prefix for the frontend subnet"
  type        = string
  #default     = "10.0.1.0/24"
}

variable "backend_subnet_prefix" {
  description = "Address prefix for the backend subnet"
  type        = string
  #default     = "10.0.2.0/24"
}

variable "database_subnet_prefix" {
  description = "Address prefix for the database subnet"
  type        = string
  #default     = "10.0.3.0/24"
}

variable "bastion_subnet_prefix" {
  description = "Address prefix for the Azure Bastion subnet"
  type        = string
}