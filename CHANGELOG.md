## 8.0.0 (2024-11-08)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** add AzureRM v4 provider major changes 90b68d5
* **AZ-1088:** module v8 structure and updates 36cdb0a

### Documentation

* **AZ-1088:** update examples 96b8b9b

### Code Refactoring

* **AZ-1088:** apply suggestions 15395d3

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 22b7349
* **deps:** update dependency opentofu to v1.8.4 91f7036
* **deps:** update dependency pre-commit to v4 390ee1c
* **deps:** update dependency pre-commit to v4.0.1 4faa031
* **deps:** update dependency trivy to v0.56.1 777a37f
* **deps:** update dependency trivy to v0.56.2 7d587a3
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 0d686a3
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 5ea51ee
* **deps:** update tools 3dcd768
* prepare for new examples structure 8092606
* update examples structure 9712ad8

## 7.2.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider b375386

### Documentation

* update README badge to use OpenTofu registry c745413
* update README with `terraform-docs` v0.19.0 29b1b94

## 7.1.0 (2024-09-20)

### Features

* **AZ-1460:** set default-outbound-access to [secure] by default 592b1d6

### Bug Fixes

* **AZ-1460:** bump min azurerm provider version to 3.107 2061533

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.7.1 df6c2d3
* **deps:** update dependency opentofu to v1.7.2 06a11a0
* **deps:** update dependency opentofu to v1.7.3 09edf19
* **deps:** update dependency opentofu to v1.8.1 017bd60
* **deps:** update dependency opentofu to v1.8.2 b5c6109
* **deps:** update dependency pre-commit to v3.7.1 881d66d
* **deps:** update dependency pre-commit to v3.8.0 58ef9b1
* **deps:** update dependency terraform-docs to v0.18.0 065c1e8
* **deps:** update dependency terraform-docs to v0.19.0 3695adc
* **deps:** update dependency tflint to v0.51.1 da8e760
* **deps:** update dependency tflint to v0.51.2 26465a9
* **deps:** update dependency tflint to v0.52.0 31ac2e1
* **deps:** update dependency trivy to v0.51.0 aa524bd
* **deps:** update dependency trivy to v0.51.1 6e96b68
* **deps:** update dependency trivy to v0.51.2 fd7c410
* **deps:** update dependency trivy to v0.51.4 7036b9a
* **deps:** update dependency trivy to v0.52.0 3090677
* **deps:** update dependency trivy to v0.52.1 0ca8e94
* **deps:** update dependency trivy to v0.52.2 c4c69ce
* **deps:** update dependency trivy to v0.53.0 2ce609a
* **deps:** update dependency trivy to v0.54.1 d6864e2
* **deps:** update dependency trivy to v0.55.0 13f46f2
* **deps:** update dependency trivy to v0.55.1 173e576
* **deps:** update dependency trivy to v0.55.2 32db042
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 89e2a1b
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 98d3109
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 5da1b44
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 7d1b8a0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 c2e6eed
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 6cc87f8
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 b590d5d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 d9c9554
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 3ae4ff3
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 00dc52c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 5c2fd14
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 55192ff
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 abe6e6f
* **deps:** update tools 628e9bd
* **deps:** update tools 4b99c6f

## 6.3.1 (2024-05-03)


### Code Refactoring

* **AZ-1403:** type `subnet_delegation` with object instead of any ac50fd4


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 45cfb94
* **AZ-1391:** update semantic-release config [skip ci] 744bdae


### Miscellaneous Chores

* **AZ-1403:** bump TF to version `1.3` minimum [BREAKING] a23261f
* **deps:** add renovate.json 885d348
* **deps:** enable automerge on renovate 9252795
* **deps:** update dependency opentofu to v1.7.0 915acb6
* **deps:** update dependency tflint to v0.51.0 137c278
* **deps:** update dependency trivy to v0.50.2 e570b88
* **deps:** update dependency trivy to v0.50.4 3556b18
* **deps:** update renovate.json af8e83a
* **pre-commit:** update commitlint hook 9bcb060
* **release:** remove legacy `VERSION` file 668ca19

# v6.3.0 - 2024-02-23

Added
  * [GH-5](https://github.com/claranet/terraform-azurerm-subnet/issues/5): Output `nsg_association` and `route_table_association` IDs

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
