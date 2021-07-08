output "win_avs" {
  value = azurerm_availability_set.win_avs
}
output "hostname"{
  value = values(azurerm_windows_virtual_machine.win_vm)[*].name

}

output "pub_ip" {
  value = azurerm_public_ip.win_pub_ip
}

output "win_nic" {
  value = azurerm_network_interface.win_nic
}
