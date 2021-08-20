locals {
  name_prefix  = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""
  default_name = lower("${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}")

  subnet_name = coalesce(var.custom_subnet_name, "${local.default_name}-subnet")

  network_security_group_rg = coalesce(var.network_security_group_rg, var.resource_group_name)
  route_table_rg            = coalesce(var.route_table_rg, var.resource_group_name)

  network_security_group_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/networkSecurityGroups/%s", data.azurerm_subscription.current.subscription_id, local.network_security_group_rg, coalesce(var.network_security_group_name, "fake"))

  route_table_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/routeTables/%s", data.azurerm_subscription.current.subscription_id, local.route_table_rg, coalesce(var.route_table_name, "fake"))
}
