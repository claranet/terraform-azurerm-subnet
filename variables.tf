variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_cidr_list" {
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

variable "private_link_service_enabled" {
  description = "Enable or disable network policies for the Private Link Service on the subnet."
  type        = bool
  default     = null
}

variable "subnet_delegation" {
  description = "Subnet delegations configuration."
  type = map(list(object({
    name    = string,
    actions = list(string)
  })))
  default  = {}
  nullable = false
}
