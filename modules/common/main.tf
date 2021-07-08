resource "azurerm_log_analytics_workspace" "loganalytic" {
  name                = var.log_analytic
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recoveryvault
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
  // type                ="SystemAssigned"
  soft_delete_enabled = true

}

resource "azurerm_storage_account" "storage" {
  name                     = var.storageaccount
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container" {
  name                  = var.storagecontainer
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}
resource "azurerm_storage_blob" "accountblob" {
  name                   = var.storage-blob
  storage_account_name   = "${azurerm_storage_account.storage.name}"
  type                   = "Block"
  storage_container_name = "${azurerm_storage_container.container.name}"
}