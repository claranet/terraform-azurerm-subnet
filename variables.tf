variable "location-short" {
  description = "Short string for Azure location."
  type        = "string"
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = "string"
}

variable "custom_subnet_names" {
  description = "Optional custom subnet names"
  type        = "list"
  default     = []
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

variable "subnet_cidr_list" {
  description = "The address prefix list to use for the subnet"
  type        = "list"
}

variable "route_table_ids" {
  description = "The Route Table Ids list to associate with the subnet"
  type        = "list"
  default     = []
}

variable "network_security_group_ids" {
  description = "The Network Security Group Ids list to associate with the subnet"
  type        = "list"
  default     = []
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = "list"
  default     = []
}
