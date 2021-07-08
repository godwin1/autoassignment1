
resource "azurerm_managed_disk" "linuxmanage_disk" {
  name                 = var.manageddisk
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_managed_disk" "winmanage_disk" {
  name                 = var.manageddisk
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

