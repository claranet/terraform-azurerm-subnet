# v4.0.0 - Unreleased

Breaking
  * AZ173/AZ-344: Terraform 0.13 upgrade. Remove all `for_each` and `count` in module.

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
