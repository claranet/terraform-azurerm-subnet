# Azure network - Subnet
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/subnet/azurerm/)

Common Azure module to generate a [Virtual Network Subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet).
This module must be used within a [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}
module "azure_network_vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  client_name         = var.client_name
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name

  vnet_cidr = ["10.0.1.0/24"]
}

module "azure_network_route_table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name
}

module "azure_network_security_group" {
  source  = "claranet/nsg/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
}

module "azure_network_subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name

  virtual_network_name = module.azure_network_vnet.virtual_network_name
  subnet_cidr_list     = ["10.0.1.0/26"]
  subnet_delegation = {
    app-service-plan = [
      {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    ]
  }

  route_table_name = module.azure_network_route_table.route_table_name

  network_security_group_name = module.azure_network_security_group.network_security_group_name

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Web"]
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.1 |
| azurerm | ~> 3.18 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.subnet](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_subnet\_name | Optional custom subnet name | `string` | `null` | no |
| environment | Project environment | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| network\_security\_group\_name | The Network Security Group name to associate with the subnets. | `string` | `null` | no |
| network\_security\_group\_rg | The Network Security Group RG to associate with the subnet. Default is the same RG than the subnet. | `string` | `null` | no |
| private\_link\_endpoint\_enabled | Enable or disable network policies for the Private Endpoint on the subnet. | `bool` | `null` | no |
| private\_link\_service\_enabled | Enable or disable network policies for the Private Link Service on the subnet. | `bool` | `null` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| route\_table\_name | The Route Table name to associate with the subnet. | `string` | `null` | no |
| route\_table\_rg | The Route Table RG to associate with the subnet. Default is the same RG than the subnet. | `string` | `null` | no |
| service\_endpoint\_policy\_ids | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `null` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet. | `list(string)` | `[]` | no |
| stack | Project stack name | `string` | n/a | yes |
| subnet\_cidr\_list | The address prefix list to use for the subnet. | `list(string)` | n/a | yes |
| subnet\_delegation | Configuration delegations on subnet<br>object({<br>  name = object({<br>    name = string,<br>    actions = list(string)<br>  })<br>}) | `map(list(any))` | `{}` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `custom_subnet_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
| virtual\_network\_name | Virtual network name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_cidr\_list | CIDR list of the created subnets |
| subnet\_cidrs\_map | Map with names and CIDRs of the created subnets |
| subnet\_id | Id of the created subnet |
| subnet\_ips | The collection of IPs within this subnet |
| subnet\_names | Names of the created subnet |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet)
