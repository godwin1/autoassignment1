output "storage_account_name" {
    value = azurerm_storage_account.storage.name
}
output "log_analytic_name"{
value =azurerm_log_analytics_workspace.loganalytic.name
}
output "recovery_vault_name"{
value =azurerm_recovery_services_vault.vault.name
}
output "storage_container_name"{
    value =azurerm_storage_container.container.name
}
output "storage_blog_name"{
    value=azurerm_storage_blob.accountblob.name
}