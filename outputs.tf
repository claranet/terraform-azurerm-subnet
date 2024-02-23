output "subnet_id" {
  description = "ID of the created subnet."
  value       = azurerm_subnet.subnet.id
}

output "subnet_cidr_list" {
  description = "CIDR list of the created subnets."
  value       = azurerm_subnet.subnet.address_prefixes
}

output "subnet_cidrs_map" {
  description = "Map with names and CIDRs of the created subnets."
  value = {
    (azurerm_subnet.subnet.name) = azurerm_subnet.subnet.address_prefixes
  }
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = azurerm_subnet.subnet.name
}

output "subnet_ips" {
  description = "The collection of IPs within this subnet."
  value       = var.subnet_cidr_list[*]
}

output "subnet_nsg_association_id" {
  description = "Subnet network security group association ID."
  value       = one(azurerm_subnet_network_security_group_association.subnet_association[*].id)
}

output "subnet_rt_association_id" {
  description = "Subnet route table association ID."
  value       = one(azurerm_subnet_route_table_association.route_table_association[*].id)
}
