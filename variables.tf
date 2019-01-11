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
  type        = "string"
  default     = ""
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
  type        = "string"
}
