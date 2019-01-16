variable "location_short" {
  description = "Short string for Azure location."
  type        = "string"
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = "string"
}

variable "custom_subnet_name" {
  description = "Optional custom subnet name"
  type        = "list"
  default     = [""]
}

variable "environment" {
  description = "Project environment"
  type        = "string"
}

variable "stack" {
  description = "Project stack name"
  type        = "string"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = "string"
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = "string"
}

variable "subnet_cidr" {
  description = "The address prefix that is used by the subnet"
  type        = "list"
}

variable "route_table_ids" {
  description = "The ID of the Route Table to associate with the subnet"
  type        = "list"
  default     = [""]
}

variable "network_security_group_ids" {
  description = "The ID of the Network Security Group to associate with the subnet"
  type        = "list"
  default     = [""]
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = "list"
  default     = []
}
