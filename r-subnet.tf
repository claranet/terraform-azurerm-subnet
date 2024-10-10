moved {
  from = azurerm_subnet.subnet
  to   = azurerm_subnet.main
}

resource "azurerm_subnet" "main" {
  name                 = local.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.cidrs

  service_endpoints           = var.service_endpoints
  service_endpoint_policy_ids = var.service_endpoint_policy_ids

  dynamic "delegation" {
    for_each = var.delegations
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

  private_endpoint_network_policies             = coalesce(var.private_endpoint_network_policies, var.private_link_endpoint_enabled ? "Enabled" : "Disabled")
  private_link_service_network_policies_enabled = var.private_link_service_enabled

  default_outbound_access_enabled = var.default_outbound_access_enabled
}

resource "azurerm_subnet_network_security_group_association" "main" {
  count = var.network_security_group_name == null ? 0 : 1

  subnet_id                 = azurerm_subnet.main.id
  network_security_group_id = local.network_security_group_id
}

moved {
  from = azurerm_subnet_network_security_group_association.subnet_association
  to   = azurerm_subnet_network_security_group_association.main
}

resource "azurerm_subnet_route_table_association" "main" {
  count = var.route_table_name == null ? 0 : 1

  subnet_id      = azurerm_subnet.main.id
  route_table_id = local.route_table_id
}

moved {
  from = azurerm_subnet_route_table_association.route_table_association
  to   = azurerm_subnet_route_table_association.main
}

data "azurerm_subscription" "main" {
}
