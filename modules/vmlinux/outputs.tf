output "vmhostname" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].name]
}

output "private_ip" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].private_ip_address]
}

output "Public_ip" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].public_ip_address]
}

output "vmlinux_nic_id" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].id]
}
output "networkinterface" {
value = [azurerm_network_interface.vm1_nic[*].id]
}
output "vm1_nic" {
value = azurerm_network_interface.vm1_nic[*]
}
// values(azurerm_network_interface.nic_linux)[*]