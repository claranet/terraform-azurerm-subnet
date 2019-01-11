resource "azurerm_subnet" "subnet" {
  name                 = "${coalesce(var.custom_subnet_name, "subnet-${var.environment}-${var.location_short}-${var.client_name}-${var.stack}")}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.virtual_network_name}"
  address_prefix       = "${var.subnet_cidr}"
}
