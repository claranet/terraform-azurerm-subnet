output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = azurerm_subnet.subnet[*].id
}

output "subnets_id" {
  description = "Id of the created subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_cidr_list" {
  description = "CIDR list of the created subnets"
  value       = azurerm_subnet.subnet.address_prefixes
}

output "subnets_cidrs_map" {
  description = "Map with names and CIDRs of the created subnets"
  value       = {
    (azurerm_subnet.subnet.name) = azurerm_subnet.subnet.address_prefixes
  }
}

output "subnet_names" {
  description = "Names of the created subnet"
  value       = azurerm_subnet.subnet.name
}

output "subnet_ips" {
  description = "The collection of IPs within this subnet"
  value       = var.subnet_cidr_list[*]
}
