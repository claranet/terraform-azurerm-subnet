output "subnet_id" {
  description = "Subnet generated id"
  value       = "${azurerm_subnet.subnet.id}"
}

output "subnet_cidr" {
  description = "Subnet CIDR"
  value       = "${azurerm_subnet.subnet.address_prefix}"
}

output "subnet_name" {
  description = "Subnet name"
  value       = "${azurerm_subnet.subnet.name}"
}

output "subnet_ip_configurations" {
  description = "The collection of IP Configurations with IPs within this subnet"
  value       = "${azurerm_subnet.subnet.ip_configurations}"
}
