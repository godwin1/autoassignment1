output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "virtual_network_address" {
  value = module.network.virtual_network_address
}

output "dbasename" {
  value = module.database.pg_dbase_name
}

output "hostname" {
  value = module.linux.vmhostname
}
output "pubic_Ip_address" {
  value = module.linux.Public_ip
}
output "Private_Ip_address" {
  value = module.linux.private_ip
}
output "win_host" {
  value     = module.window.hostname
  sensitive = true
}
output "win_pubic_Ip_address" {
  value = module.window.pub_ip
}
output "storage_analytic" {
  value = module.common.log_analytic_name
}
output "storage_vault" {
  value =module.common.recovery_vault_name
}
output "storage_blob" {
  value = module.common.storage_blog_name
}
output "loadbalancer" {
  value = module.loadbalancer.lb_name
}