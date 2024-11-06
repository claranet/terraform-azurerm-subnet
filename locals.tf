locals {
  network_security_group_rg = coalesce(var.network_security_group_rg, var.resource_group_name)
  route_table_rg            = coalesce(var.route_table_rg, var.resource_group_name)

  network_security_group_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/networkSecurityGroups/%s", data.azurerm_subscription.main.subscription_id, local.network_security_group_rg, coalesce(var.network_security_group_name, "fake"))

  route_table_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/routeTables/%s", data.azurerm_subscription.main.subscription_id, local.route_table_rg, coalesce(var.route_table_name, "fake"))
}
