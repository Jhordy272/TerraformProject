output "server_name" {
  value = azurerm_mysql_flexible_server.mysql_server.name
}

output "server_fqdn" {
  value = azurerm_mysql_flexible_server.mysql_server.fqdn
}

output "database_name" {
  value = azurerm_mysql_flexible_database.mysql_db.name
}

output "database_private_ip" {
  value  = azurerm_mysql_flexible_server.mysql_server.fqdn
}
