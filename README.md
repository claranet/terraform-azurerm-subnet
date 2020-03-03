# Azure network - Subnet
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/subnet/azurerm/)

Common Azure module to generate a [Virtual Network Subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet).
This module must be used within a [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

## Version compatibility

| Module version | Terraform version | AzureRM version |
|----------------|-------------------| --------------- |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

locals {
  vnet_cidr = "10.10.0.0/16"
  subnets = {
    "${var.stack}-${var.client_name}-${module.azure-region.location_short}-${var.environment}-subnet1"      = "10.10.0.0/24"
    "${var.stack}-${var.client_name}-${module.azure-region.location_short}-${var.environment}-subnetTWO"    = "10.10.1.0/24"
    "${var.stack}-${var.client_name}-${module.azure-region.location_short}-${var.environment}-subnet_trois" = "10.10.2.0/24"
  }
}

module "azure-network-vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment      = var.environment
  location         = module.azure-region.location
  location_short   = module.azure-region.location_short
  client_name      = var.client_name
  stack            = var.stack
  custom_vnet_name = var.custom_vnet_name

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = [local.vnet_cidr]
}

module "azure-network-route-table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short
}

module "azure-network-subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment         = var.environment
  location_short      = module.azure-region.location_short
  client_name         = var.client_name
  stack               = var.stack
  custom_subnet_names = keys(local.subnets)

  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = module.azure-network-vnet.virtual_network_name
  subnet_cidr_list     = values(local.subnets)

  route_table_ids = {
    keys(local.subnets)[0] = module.azure-network-route-table.route_table_id
    keys(local.subnets)[2] = module.azure-network-route-table.route_table_id
  }

  network_security_group_ids = {
    keys(local.subnets)[1] = module.network-security-group-A.network_security_group_id
    keys(local.subnets)[2] = module.network-security-group-B.network_security_group_id
  }

  service_endpoints = var.service_endpoints
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_subnet\_names | Optional custom subnet names | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| enforce\_private\_link | Enable or Disable network policies for the private link endpoint on the subnet | `bool` | `false` | no |
| environment | Project environment | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for subnet names | `string` | `""` | no |
| network\_security\_group\_ids | The Network Security Group Ids map to associate with the subnets | `map(string)` | `"null"` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| route\_table\_ids | The Route Table Ids map to associate with the subnets | `map(string)` | `"null"` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet | `list(string)` | `[]` | no |
| stack | Project stack name | `string` | n/a | yes |
| subnet\_cidr\_list | The address prefix list to use for the subnets | `list(string)` | n/a | yes |
| virtual\_network\_name | Virtual network name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_cidr\_list | CIDR list of the created subnets |
| subnet\_ids | IDs of the created subnets |
| subnet\_ips | The collection of IPs within this subnet |
| subnet\_names | Names list of the created subnet |
| subnets\_cidrs\_map | Map with names and CIDRs of the created subnets |
| subnets\_ids\_map | Map with names and IDs of the created subnets |

## Related documentation

Terraform resource documentation: [terraform.io/docs/providers/azurerm/r/subnet.html](https://www.terraform.io/docs/providers/azurerm/r/subnet.html)

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet)
