resource "azurerm_availability_set" "av_set" {
  name                = var.avs
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_linux_virtual_machine" "linuxvm1" {
  tags                  = local.common_tags
  count                 = var.nb_count
  name                  = "${var.vm_linux_name}${format("%1d", count.index + 1)}"
  resource_group_name   = var.rg_name
  location              = var.location
  availability_set_id   = azurerm_availability_set.av_set.id
  network_interface_ids = [element(azurerm_network_interface.vm1_nic[*].id, count.index + 1)]
  computer_name         = "${var.vm_linux_name}-${format("%1d", count.index + 1)}"
  size                  = var.vm_size
  admin_username        = var.username
  depends_on            = [azurerm_availability_set.av_set]

  admin_ssh_key {
    username   = var.username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${var.vm_linux_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attributes["los_disk_caching"]
    storage_account_type = var.os_disk_attributes["los_storage_account_type"]
  }

  source_image_reference {
    publisher = var.os_info["los_publisher"]
    offer     = var.os_info["los_offer"]
    sku       = var.os_info["los_sku"]
    version   = var.os_info["los_version"]
  }


}


resource "azurerm_network_interface" "vm1_nic" {
  count               = var.nb_count
  tags                = local.common_tags
  name                = "${var.vm_linux_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  ip_configuration {
    name                          = "${var.vm_linux_name}-ip-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = element(azurerm_public_ip.vm1_pip[*].id, count.index)
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "vm1_pip" {
  count               = var.nb_count
  tags                = local.common_tags
  name                = "${var.vm_linux_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
}
// testing Datadisk in vm
resource "azurerm_virtual_machine_data_disk_attachment" "attachedDisk" {
  count              = length(var.nb_count)
  managed_disk_id     = element(azurerm_managed_disk.linuxmanage_disk[*].id, count.index)
  lun                = "10"
  caching            = "ReadWrite"
  virtual_machine_id  = "${azurerm_linux_virtual_machine.linuxvm1[count.index].id}"
  
}
resource "azurerm_managed_disk" "linuxmanage_disk" {
  name                 = var.manageddisk
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}
