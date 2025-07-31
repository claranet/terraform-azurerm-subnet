resource "azurerm_subnet_nat_gateway_association" "main" {
  count          = var.nat_gateway == null ? 0 : 1
  nat_gateway_id = var.nat_gateway.id
  subnet_id      = azurerm_subnet.main.id
}
