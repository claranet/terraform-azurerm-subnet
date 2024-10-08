output "resource" {
  description = "Subnet resource object."
  value       = azurerm_subnet.main
}

output "id" {
  description = "ID of the created subnet."
  value       = azurerm_subnet.main.id
}

output "cidrs_list" {
  description = "CIDR list of the created subnets."
  value       = azurerm_subnet.main.address_prefixes
}

output "cidrs_map" {
  description = "Map with names and CIDRs of the created subnets."
  value = {
    (azurerm_subnet.main.name) = azurerm_subnet.main.address_prefixes
  }
}

output "name" {
  description = "Name of the created subnet."
  value       = azurerm_subnet.main.name
}

output "ips" {
  description = "The collection of IPs within this subnet."
  value       = var.subnet_cidr_list[*]
}

output "nsg_association_id" {
  description = "Subnet network security group association ID."
  value       = one(azurerm_subnet_network_security_group_association.subnet_association[*].id)
}

output "rt_association_id" {
  description = "Subnet route table association ID."
  value       = one(azurerm_subnet_route_table_association.route_table_association[*].id)
}
