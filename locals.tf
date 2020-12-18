locals {
  name_prefix  = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""
  default_name = lower("${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}")

  subnet_name = coalesce(var.custom_subnet_name, "${local.default_name}-subnet")

  subnets_outputs = zipmap(azurerm_subnet.subnet[*].name, azurerm_subnet.subnet[*].id)

  network_security_group_rg = coalesce(var.network_security_group_rg, var.resource_group_name)
  route_table_rg            = coalesce(var.route_table_rg, var.resource_group_name)

  network_security_group_id = join("", ["/subscriptions/", data.azurerm_subscription.current.subscription_id, "/resourceGroups/", local.network_security_group_rg, "/providers/Microsoft.Network/networkSecurityGroups/", coalesce(var.network_security_group_name, "fake")])

  route_table_id = join("", ["/subscriptions/", data.azurerm_subscription.current.subscription_id, "/resourceGroups/", local.route_table_rg, "/providers/Microsoft.Network/routeTables/", coalesce(var.route_table_name, "fake")])
}
