resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_cidr_list)

  name = coalesce(
    element(var.custom_subnet_names, count.index),
    length(var.subnet_cidr_list) == 1 ? local.subnet_name : "${local.subnet_name}${count.index}",
  )
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefix       = element(var.subnet_cidr_list, count.index)

  // Avoid collision with subnet_association and route_table_association
  // Can be removed when azurerm v2.0 will be released
  lifecycle {
    ignore_changes = [route_table_id, network_security_group_id]
  }

  service_endpoints = var.service_endpoints
}

resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  for_each = coalesce(var.network_security_group_ids, {})

  subnet_id                 = lookup(local.subnets_outputs, each.key)
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  for_each = coalesce(var.route_table_ids, {})

  subnet_id      = lookup(local.subnets_outputs, each.key)
  route_table_id = each.value
}
