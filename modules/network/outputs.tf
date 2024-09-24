output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "frontend_subnet_id" {
  value = azurerm_subnet.frontend_subnet.id
}

output "backend_subnet_id" {
  value = azurerm_subnet.backend_subnet.id
}

output "database_subnet_id" {
  value = azurerm_subnet.database_subnet.id
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion_subnet.id
}

output "public_ip_address_id" {
  value = azurerm_public_ip.bastion_ip.id
}

output "azurerm_lb_backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.frontend_pool.id
}

output "lb_frontend_pip" {
  value = azurerm_public_ip.lb_frontend_pip.ip_address
}
