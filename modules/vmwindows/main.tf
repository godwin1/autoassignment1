resource "azurerm_availability_set" "win_avs" {
  name                         = var.windows_av_set
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  // depends_on = [ azurerm_resource_group.rgp1]
}

resource "azurerm_network_interface" "win_nic" {
  for_each            = var.windows_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name
  // depends_on          =[
  // azurerm_resource_group.rgp1, azurerm_virtual_network.vnet1
  //  ] 

  ip_configuration {
    name                          = each.key
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.win_pub_ip[each.key].id
  }

  tags = local.common_tags

}


resource "azurerm_public_ip" "win_pub_ip" {
  for_each            = var.windows_name
  name                = "${each.key}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_windows_virtual_machine" "win_vm" {
  name                = "${each.key}"
  for_each            = var.windows_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = each.value
  computer_name       = each.key
  admin_username = "windowusers1"
  admin_password = "P@ssw0rd123"

  network_interface_ids = [azurerm_network_interface.win_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.win_avs.id
  tags                  = local.common_tags
  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = "ReadWrite"
    storage_account_type = var.windows_disk["wos_storage_account_type"]
    disk_size_gb         = var.windows_disk["DiskSize"]
  }

  source_image_reference {
    publisher = var.windows_disk["publisher"]
    offer     = var.windows_disk["Offer"]
    sku       = var.windows_disk["SKU"]
    version   = var.windows_disk["Version"]
  }

}
resource "azurerm_virtual_machine_extension" "vmantivirus" {
name = var.vmantivirus
for_each            = var.windows_name
virtual_machine_id =   "${azurerm_windows_virtual_machine.win_vm[each.key].id}"
publisher = "Microsoft.Azure.Security"
type = "IaaSAntimalware"
type_handler_version = "1.3"
auto_upgrade_minor_version = "true"

settings = <<SETTINGS
{
"AntimalwareEnabled": true,
"RealtimeProtectionEnabled": "true",
"ScheduledScanSettings": {
"isEnabled": "true",
"day": "1",
"time": "120",
"scanType": "Quick"
},
"Exclusions": {
"Extensions": "",
"Paths": "",
"Processes": ""
}
}
SETTINGS
}
// testing data disk with windows

resource "azurerm_virtual_machine_data_disk_attachment" "attachedDisk" {
  for_each           = var.windows_name
  managed_disk_id    = "${azurerm_managed_disk.winmanage_disk.id}"
  lun                = "10"
  caching            = "ReadWrite"
  virtual_machine_id  = "${azurerm_windows_virtual_machine.win_vm[each.key].id}"

  
}

resource "azurerm_managed_disk" "winmanage_disk" {
  name                 = var.manageddisk
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}