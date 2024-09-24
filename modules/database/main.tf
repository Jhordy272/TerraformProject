#Create mysql server
resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                   = "mysql-${var.environment}-${var.project_name}"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  sku_name               = var.sku_name
  zone                   = var.zone 
}

#Create mysql database
resource "azurerm_mysql_flexible_database" "mysql_db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}


# #Create mysql virtual network rule
# resource "azurerm_mysql_virtual_network_rule" "mysql_vnet_rule" {
#   name                = "mysql-vnet-rule"
#   resource_group_name = var.resource_group_name
#   server_name         = azurerm_mysql_flexible_server.mysql_server.name
#   subnet_id           = var.subnet_id
# }