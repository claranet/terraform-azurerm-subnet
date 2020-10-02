
# resource "null_resource" "subnetdatasource" {
#   count = length(var.subnet_cidr_list)
#   triggers = {
#     name = coalesce(
#       element(var.custom_subnet_names, count.index),
#       length(var.subnet_cidr_list) == 1 ? local.subnet_name : "${local.subnet_name}${count.index}",
#     )
#   }
# }

resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_cidr_list)

  name = coalesce(
    element(var.custom_subnet_names, count.index),
    length(var.subnet_cidr_list) == 1 ? local.subnet_name : "${local.subnet_name}${count.index}",
  )

  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [element(var.subnet_cidr_list, count.index)]

  service_endpoints = coalesce(
    lookup(
      coalesce(var.custom_service_endpoints, {}),
      coalesce(
        element(var.custom_subnet_names, count.index),
        length(var.subnet_cidr_list) == 1 ? local.subnet_name : "${local.subnet_name}${count.index}",
      ),
      null
    ),
    var.service_endpoints,
  )

  enforce_private_link_endpoint_network_policies = coalesce(
    lookup(
      coalesce(var.custom_enforce_private_links, {}),
      coalesce(
        element(var.custom_subnet_names, count.index),
        length(var.subnet_cidr_list) == 1 ? local.subnet_name : "${local.subnet_name}${count.index}",
      ),
      null
    ),
    var.enforce_private_link
  )
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
