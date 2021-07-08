output "virtual_network_name" {
  value = azurerm_virtual_network.vnet1.name
}

output "virtual_network_address" {
  value = azurerm_virtual_network.vnet1.address_space
}

output "subnet1" {
  value = azurerm_subnet.subnet1
}

output "subnet1_address_prefix" {
  value = azurerm_subnet.subnet1.address_prefixes
}
