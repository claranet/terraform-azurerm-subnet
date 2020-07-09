output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = azurerm_subnet.subnet[*].id
}

output "subnets_ids_map" {
  description = "Map with names and IDs of the created subnets"
  value       = local.subnets_outputs
}

output "subnet_cidr_list" {
  description = "CIDR list of the created subnets"
  value       = azurerm_subnet.subnet[*].address_prefix
}

output "subnets_cidrs_map" {
  description = "Map with names and CIDRs of the created subnets"
  value       = zipmap(azurerm_subnet.subnet[*].name, azurerm_subnet.subnet[*].address_prefix)
}

output "subnet_names" {
  description = "Names list of the created subnet"
  value       = azurerm_subnet.subnet[*].name
}

output "subnet_ips" {
  description = "The collection of IPs within this subnet"
  value       = var.subnet_cidr_list[*]
}
