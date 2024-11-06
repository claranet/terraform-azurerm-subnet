module "route_table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.name
}

# module "network_security_group" {
#   source  = "claranet/nsg/azurerm"
#   version = "x.x.x"

#   client_name         = var.client_name
#   environment         = var.environment
#   location            = module.azure_region.location
#   location_short      = module.azure_region.location_short
#   stack               = var.stack
#   resource_group_name = module.rg.name
# }

module "subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.name

  virtual_network_name = module.vnet.name
  cidrs                = ["10.0.1.0/26"]
  delegations = {
    app-service-plan = [
      {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    ]
  }

  route_table_name = module.route_table.name

  # network_security_group_name = module.network_security_group.name

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Web"]
}
