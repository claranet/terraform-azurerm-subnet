# Azure network - Subnet

Common Azure module to generate a [Virtual Newtork Subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet). 
This feature must be used within a [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

## Prerequisites

* module.az-region.location-short: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=xxx
* module.rg.resource_group_name: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=xxx
* module.vnet.virtual_network_name: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=xxx


## Usage

```hcl
module "azure-region" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=vX.X.X"

  azure_region = "${var.azure_region}"
}

module "rg" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=vX.X.X"

  location    = "${module.azure-region.location}"
  client_name = "${var.client_name}"
  environment = "${var.environment}"
  stack       = "${var.stack}"
}

module "azure-network-vnet" {
    source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=vX.X.X"
    
    environment      = "${var.environment}"
    location         = "${module.azure-region.location}"
    location_short   = "${module.azure-region.location-short}"
    client_name      = "${var.client_name}"
    stack            = "${var.stack}"
    custom_vnet_name = "${var.custom_vnet_name}"

  resource_group_name = "${module.rg.resource_group_name}"
  vnet_cidr           = ["10.10.0.0/16"]
}

module "azure-network-subnet" {
  source = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/subnet.git?ref=vX.X.X"

  environment		= "${var.environment}"
  location_short	= "${module.azure-region.location_short}"
  client_name		= "${var.client_name}"
  stack			= "${var.stack}"
  custom_subnet_names	= "${var.custom_subnet_names}"

  resource_group_name  = "${module.rg.resource_group_name}"
  virtual_network_name = "${module.vnet.virtual_network_name}"
  subnet_cidr_list     = ["10.10.10.0/24"]

  # Those lists must be the same size as `subnet_cidr_list` or not set
  route_table_ids           = "${var.route_table_ids}"
  network_security_group_id = "${var.network_security_group_ids}"

  service_endpoints = "${var.service_endpoints}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_name | Client name/account used in naming | string | n/a | yes |
| custom\_subnet\_names | Optional custom subnet names | list | `<list>` | no |
| environment | Project environment | string | n/a | yes |
| location-short | Short string for Azure location. | string | n/a | yes |
| network\_security\_group\_ids | The Network Security Group Ids list to associate with the subnet | list | `<list>` | no |
| resource\_group\_name | Resource group name | string | n/a | yes |
| route\_table\_ids | The Route Table Ids list to associate with the subnet | list | `<list>` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet | list | `<list>` | no |
| stack | Project stack name | string | n/a | yes |
| subnet\_cidr\_list | The address prefix list to use for the subnet | list | n/a | yes |
| virtual\_network\_name | Virtual network name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_cidr\_list | CIDR list of the created subnets |
| subnet\_ids | Ids of the created subnets |
| subnet\_ip\_configurations | The collection of IP Configurations with IPs within this subnet |
| subnet\_names | Names list of the created subnet |

## Related documentation

Terraform resource documentation: [https://www.terraform.io/docs/providers/azurerm/r/subnet.html]

Microsoft Azure documentation: [https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet]
