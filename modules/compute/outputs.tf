output "vm_ids" {
  value = azurerm_linux_virtual_machine.vm[*].id
}

output "vm_private_ips" {
  value = azurerm_network_interface.vm_nic[*].private_ip_address
}

output "azurerm_network_interface_vm_nic_id" {
  value = azurerm_network_interface.vm_nic[*].id
}