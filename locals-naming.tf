locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  subnet_name = coalesce(var.custom_subnet_name, data.azurecaf_name.subnet.result)
}
