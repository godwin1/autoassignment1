output "vmhostname" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].name]
}

output "private_ip" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].private_ip_address]
}

output "Public_ip" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].public_ip_address]
}

output "vmlinux_id" {
  value = [azurerm_linux_virtual_machine.linuxvm1[*].id]
}
