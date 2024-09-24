#Create storage account for tfstate
resource "azurerm_storage_account" "finaltaskepam" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "finaltaskepam"
  }
}

#Create storage container for tfstate
resource "azurerm_storage_container" "tfstate" {
  name                  = var.storage_account_container_name
  storage_account_name  = azurerm_storage_account.finaltaskepam.name
  container_access_type = "private"
}

#Create resource group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${terraform.workspace}-${var.project_name}"
  location = var.location
}

#Create vm for frontend
module "frontend_vm" {
  source               = "./modules/compute"
  environment          = terraform.workspace
  project_name         = var.project_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  vm_count             = var.frontend_vm_count
  vm_size              = var.frontend_vm_size
  admin_username       = var.vm_admin_username
  ssh_public_key_path  = var.ssh_public_key_path
  subnet_id            = module.network.frontend_subnet_id
  vm_role              = "frontend"
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool_association" {
  network_interface_id    = module.frontend_vm.azurerm_network_interface_vm_nic_id[0]
  ip_configuration_name   = "ipconfig-0"
  backend_address_pool_id = module.network.azurerm_lb_backend_address_pool_id
}

#Create vm for backend
module "backend_vm" {
  source               = "./modules/compute"
  environment          = terraform.workspace
  project_name         = var.project_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  vm_count             = var.backend_vm_count
  vm_size              = var.backend_vm_size
  admin_username       = var.vm_admin_username
  ssh_public_key_path  = var.ssh_public_key_path
  subnet_id            = module.network.backend_subnet_id
  vm_role              = "backend"
}

#Create database
module "mysql_database" {
  source              = "./modules/database"
  environment         = terraform.workspace
  project_name        = var.project_name
  #location            = "japaneast"
  resource_group_name = azurerm_resource_group.rg.name
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
  database_name       = var.db_name
  subnet_id           = module.network.database_subnet_id
}

#Create bastion
module "bastion" {
  source               = "./modules/bastion"
  environment          = terraform.workspace
  project_name         = var.project_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  subnet_id            = module.network.bastion_subnet_id
  vm_count             = var.bastion_vm_count
  vm_size              = var.bastion_vm_size
  admin_username       = var.vm_admin_username
  ssh_public_key_path  = var.ssh_public_key_path
  public_ip_address_id = module.network.public_ip_address_id
}

#Create network
module "network" {
  source               = "./modules/network"
  environment          = terraform.workspace
  project_name         = var.project_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  vnet_address_space   = var.vnet_address_space
  frontend_subnet_prefix = var.frontend_subnet_prefix
  backend_subnet_prefix  = var.backend_subnet_prefix
  database_subnet_prefix = var.database_subnet_prefix
  bastion_subnet_prefix = var.bastion_subnet_prefix
}