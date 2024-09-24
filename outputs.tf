output "private_ip_address_backend" {
  value = module.backend_vm.vm_private_ips
}

output "private_ip_address_frontend" {
  value = module.frontend_vm.vm_private_ips
}

output "private_ip_address_database" {
  value = module.mysql_database.database_private_ip
}

output "bastion_public_ip" {
  value = module.bastion.bastion_public_ip
}

output "load_balancer_public_ip" {
  value = module.network.lb_frontend_pip
}