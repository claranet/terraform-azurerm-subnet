# Azure network - Subnet
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/subnet/azurerm/)

Common Azure module to generate a [Virtual Network Subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet).
This module must be used within a [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
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

module "network_security_group" {
  source  = "claranet/nsg/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  stack               = var.stack
  resource_group_name = module.rg.name
}

module "subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.name

  virtual_network_name = module.vnet.name
  subnet_cidr_list     = ["10.0.1.0/26"]
  subnet_delegation = {
    app-service-plan = [
      {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    ]
  }

  route_table_name = module.route_table.name

  network_security_group_name = module.network_security_group.name

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Web"]
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.route_table_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurecaf_name.subnet](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_subnet\_name | Optional custom subnet name. | `string` | `null` | no |
| default\_outbound\_access\_enabled | Enable or Disable default\_outbound\_access. See https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/default-outbound-access | `bool` | `false` | no |
| environment | Project environment. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| network\_security\_group\_name | The Network Security Group name to associate with the subnets. | `string` | `null` | no |
| network\_security\_group\_rg | The Network Security Group RG to associate with the subnet. Default is the same RG than the subnet. | `string` | `null` | no |
| private\_link\_endpoint\_enabled | Enable or disable network policies for the Private Endpoint on the subnet. | `bool` | `null` | no |
| private\_link\_service\_enabled | Enable or disable network policies for the Private Link Service on the subnet. | `bool` | `null` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| route\_table\_name | The Route Table name to associate with the subnet. | `string` | `null` | no |
| route\_table\_rg | The Route Table RG to associate with the subnet. Default is the same RG than the subnet. | `string` | `null` | no |
| service\_endpoint\_policy\_ids | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `null` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet. | `list(string)` | `[]` | no |
| stack | Project stack name. | `string` | n/a | yes |
| subnet\_cidr\_list | The address prefix list to use for the subnet. | `list(string)` | n/a | yes |
| subnet\_delegation | Subnet delegations configuration. | <pre>map(list(object({<br/>    name    = string<br/>    actions = list(string)<br/>  })))</pre> | `{}` | no |
| virtual\_network\_name | Virtual network name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cidrs\_list | CIDR list of the created subnets. |
| cidrs\_map | Map with names and CIDRs of the created subnets. |
| id | ID of the created subnet. |
| ips | The collection of IPs within this subnet. |
| name | Name of the created subnet. |
| nsg\_association\_id | Subnet network security group association ID. |
| resource | Subnet resource object. |
| rt\_association\_id | Subnet route table association ID. |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-subnet)
