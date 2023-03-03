# v6.2.0 - 2023-03-03

Changed
  * [GH-4](https://github.com/claranet/terraform-azurerm-subnet/pull/4): Use singular for output name `subnet_name`

# v6.1.0 - 2022-11-25

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v6.0.0 - 2022-09-16

Changed
  * AZ-844: `enforce_private_link_endpoint_network_policies` will be removed in favour of the property `private_endpoint_network_policies_enabled`

Breaking
  * AZ-844: Require Terraform `v1.1+` and AzureRM provider `v3.18+`
  * AZ-844: Add more services endpoints and private link parameters

# v5.0.0 - 2022-03-31

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

Changed
  * AZ-572: Revamp examples and improve CI

# v4.2.1 - 2021-08-20

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool
  * AZ-530: Cleanup module, fix linter errors

# v4.2.0 - 2021-01-15

Breaking
  * AZ-405: Fix dependencies issues with network security group and route table associations

# v4.1.0 - 2020-12-15

Changed
  * AZ-398: Force lowercase on default generated name

# v3.2.0/v4.0.0 - 2020-11-27

Breaking
  * AZ-344: Terraform 0.13 upgrade. Remove all `for_each` and `count` in module.

Changed
  * AZ-273: Upgrade CI

# v3.1.0 - 2020-11-19

Added
  * AZ-332: Allow to configure subnet delegation

# v3.0.0 - 2020-07-09

Breaking
  * AZ-198: AzureRM 2.0 compatibility + remove `ip_configurations` output

# v2.2.0 - 2020-03-27

Added
  * AZ-213: Add a parameter to manage `enforce_private_link_endpoint_network_policies`.

Changed
  * AZ-203: Fix `route_table_ids` and `network_security_group_ids` variables null values

# v2.1.1 - 2020-02-17

Changed
  * AZ-185: Update README

# v2.1.0 - 2020-02-12

Breaking
  * AZ-171: Revamp subnet module inputs (more flexible with NSG and RT associations)

# v2.0.3 - 2019-11-22

Added
  * AZ-136: Add maps outputs

# v2.0.2 - 2019-11-20

Changed
  * AZ-136: Fix syntax warning

# v2.0.1 - 2019-10-31

Changed
  * AZ-136: Fix deprecation warning (related to Azure provider 2.0)

# v2.0.0 - 2019-09-27

Breaking
  * AZ-94: Terraform 0.12 / HCL2 format

Added
  * AZ-118: Add LICENSE, NOTICE & Github badges
  * AZ-119: Add CONTRIBUTING.md doc and `terraform-wrapper` usage with the module

Changed
  * AZ-119: Revamp README and publish this module to Terraform registry

# v1.1.1 - 2019-06-19

Added
  * AZ-105 Allow prefix for subnet naming

# v1.1.0 - 2019-06-04

Added
  * AZ-95 Explicit count variable for input routes and security groups

# v1.0.0 - 2019-05-14

Added
  * AZ-22 First Release
