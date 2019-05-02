locals {
  subnet_name = "${var.stack}-${var.client_name}-${var.location-short}-${var.environment}-subnet"

  default_tags = {
    env   = "${var.environment}"
    stack = "${var.stack}"
  }
}
