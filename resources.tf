resource "azurerm_subnet" "subnet" {
  name                 = local.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_cidr_list

  service_endpoints = var.service_endpoints

  dynamic "delegation" {
    for_each = var.subnet_delegation
    content {
      name = delegation.key
      dynamic "service_delegation" {
        for_each = toset(delegation.value)
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }

  enforce_private_link_endpoint_network_policies = var.enforce_private_link
}

resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  count = var.network_security_group_id != null ? 1 : 0

  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = var.network_security_group_id
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  count          = var.route_table_id != null ? 1 : 0
  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = var.route_table_id
}
