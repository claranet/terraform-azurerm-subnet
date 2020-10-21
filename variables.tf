variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for subnet names"
  type        = string
  default     = ""
}

variable "custom_subnet_name" {
  description = "Optional custom subnet name"
  type        = string
  default     = null
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
  description = "The address prefix list to use for the subnet"
  type        = list(string)
}

variable "route_table_id" {
  description = "The Route Table Id to associate with the subnet"
  type        = string
  default     = null
}

variable "network_security_group_id" {
  description = "The Network Security Group Id to associate with the subnets"
  type        = string
  default     = null
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "enforce_private_link" {
  description = "Enable or Disable network policies for the private link endpoint on the subnet"
  type        = bool
  default     = false
}

variable "subnet_delegation" {
  description = <<EOD
Configuration delegations on subnet
object({
  name = object({
    name = string,
    actions = list(string)
  })
})
EOD
  type = map(list(any))
  default = {}
}
