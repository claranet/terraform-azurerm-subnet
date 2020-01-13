locals {
  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""
  subnet_name = "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-subnet"

  subnets_outputs = zipmap(azurerm_subnet.subnet.*.name, azurerm_subnet.subnet.*.id)
}
