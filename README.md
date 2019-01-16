# Azure network - Subnet

Common Azure module to generate a subnet.
This feature must be used with a virtual network, it can't be generated alone.

## Prerequisites

* module.az-region.location-short: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/regions.git?ref=xxx
* module.rg.resource_group_name: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/rg.git?ref=xxx
* module.vnet.virtual_network_name: git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/vnet.git?ref=xxx


## Mandatory Usage

```shell
module "azure-network-subnet" {
    source              = "git::ssh://git@git.fr.clara.net/claranet/cloudnative/projects/cloud/azure/terraform/modules/subnet.git?ref=xxx"

    environment         = "${var.environment}"
    location_short      = "${module.azure-region.location_short}" 
    client_name         = "${var.client_name}"
    stack               = "${var.stack}"
    custom_subnet_name  = "${var.custom_subnet_name}"

    resource_group_name     = "${module.rg.resource_group_name}"
    virtual_network_name    = "${module.vnet.virtual_network_name}"
    subnet_cidr             = "${var.subnet_cidr}"

    route_table_id            = "${var.route_table_ids}"
    network_security_group_id = "${var.network_security_group_ids}"

    service_endpoints         = "${var.service_endpoints}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client_name | Client name/account used in naming | string | - | yes |
| custom_subnet_name | Optional custom subnet name | list | `<list>` | no |
| environment | Project environment | string | - | yes |
| location_short | Short string for Azure location. | string | - | yes |
| network_security_group_ids | The ID of the Network Security Group to associate with the subnet | list | `<list>` | no |
| resource_group_name | Resource group name | string | - | yes |
| route_table_ids | The ID of the Route Table to associate with the subnet | list | `<list>` | no |
| service_endpoints | The list of Service endpoints to associate with the subnet | list | `<list>` | no |
| stack | Project stack name | string | - | yes |
| subnet_cidr | The address prefix that is used by the subnet | list | - | yes |
| virtual_network_name | Virtual network name | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet_cidr | The CIDR for the subnet |
| subnet_id | Subnet generated id |
| subnet_ip_configurations | The collection of IP Configurations with IPs within this subnet |
| subnet_name | The name of the subnet |