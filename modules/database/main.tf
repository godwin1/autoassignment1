resource "azurerm_postgresql_server" "db_server" {
  name                = var.dbase_server
  location            =var.location
  resource_group_name = var.rg_name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 30
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladminun"
  administrator_login_password = "P@$$w0rd123"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "pg_dbase" {
  name                = var.pg_dbase
  resource_group_name = var.rg_name
  server_name         = "${azurerm_postgresql_server.db_server.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}