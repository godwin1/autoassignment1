resource "null_resource" "linux_provisioner" {
  count = var.nb_count
  depends_on = [
  azurerm_linux_virtual_machine.linuxvm1, azurerm_network_interface.vm1_nic, ]

  triggers = {
    network_interface_ids = join(",", azurerm_network_interface.vm1_nic[*].id)
  }

  provisioner "local-exec" {
    command = "sleep 6; cat /etc/hostname"
  }
}

