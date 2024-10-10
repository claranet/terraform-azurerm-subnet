variable "virtual_network_name" {
  description = "Virtual network name."
  type        = string
}

variable "cidrs" {
  description = "The address prefix list to use for the subnet."
  type        = list(string)
}

variable "route_table_name" {
  description = "The Route Table name to associate with the subnet."
  type        = string
  default     = null
}

variable "route_table_rg" {
  description = "The Route Table RG to associate with the subnet. Default is the same RG than the subnet."
  type        = string
  default     = null
}

variable "network_security_group_name" {
  description = "The Network Security Group name to associate with the subnets."
  type        = string
  default     = null
}

variable "network_security_group_rg" {
  description = "The Network Security Group RG to associate with the subnet. Default is the same RG than the subnet."
  type        = string
  default     = null
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = null
}

variable "private_link_endpoint_enabled" {
  description = "Enable or disable network policies for the Private Endpoint on the subnet."
  type        = bool
  default     = null
}

variable "private_endpoint_network_policies" {
  description = "Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`."
  type        = string
  default     = null
}

variable "private_link_service_enabled" {
  description = "Enable or disable network policies for the Private Link Service on the subnet."
  type        = bool
  default     = null
}

variable "delegations" {
  description = "Subnet delegations configuration."
  type = map(list(object({
    name    = string
    actions = list(string)
  })))
  default  = {}
  nullable = false
}

variable "default_outbound_access_enabled" {
  description = "Enable or disable `default_outbound_access`. See [documentation](https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/default-outbound-access)."
  type        = bool
  default     = false
}
