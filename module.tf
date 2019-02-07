resource "azurerm_subnet" "subnet" {
  count                = "${length(var.subnet_cidr)}"
  name                 = "${length(var.subnet_cidr) == 1 ? coalesce(element(var.custom_subnet_name, count.index), "${var.stack}-${var.client_name}-${var.location-short}-${var.environment}-subnet") : coalesce(element(var.custom_subnet_name, count.index), "${var.stack}-${var.client_name}-${var.location-short}-${var.environment}-subnet${count.index}")}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${var.virtual_network_name}"
  address_prefix       = "${element(var.subnet_cidr,count.index)}"

  route_table_id            = "${element(var.route_table_ids,count.index)}"
  network_security_group_id = "${element(var.network_security_group_ids,count.index)}"

  service_endpoints = "${var.service_endpoints}"
}
