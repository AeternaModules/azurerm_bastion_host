output "bastion_hosts" {
  description = "All bastion_host resources"
  value       = azurerm_bastion_host.bastion_hosts
}
output "bastion_hosts_copy_paste_enabled" {
  description = "List of copy_paste_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.copy_paste_enabled]
}
output "bastion_hosts_dns_name" {
  description = "List of dns_name values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.dns_name]
}
output "bastion_hosts_file_copy_enabled" {
  description = "List of file_copy_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.file_copy_enabled]
}
output "bastion_hosts_ip_configuration" {
  description = "List of ip_configuration values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.ip_configuration]
}
output "bastion_hosts_ip_connect_enabled" {
  description = "List of ip_connect_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.ip_connect_enabled]
}
output "bastion_hosts_kerberos_enabled" {
  description = "List of kerberos_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.kerberos_enabled]
}
output "bastion_hosts_location" {
  description = "List of location values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.location]
}
output "bastion_hosts_name" {
  description = "List of name values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.name]
}
output "bastion_hosts_private_only_enabled" {
  description = "List of private_only_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.private_only_enabled]
}
output "bastion_hosts_resource_group_name" {
  description = "List of resource_group_name values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.resource_group_name]
}
output "bastion_hosts_scale_units" {
  description = "List of scale_units values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.scale_units]
}
output "bastion_hosts_session_recording_enabled" {
  description = "List of session_recording_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.session_recording_enabled]
}
output "bastion_hosts_shareable_link_enabled" {
  description = "List of shareable_link_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.shareable_link_enabled]
}
output "bastion_hosts_sku" {
  description = "List of sku values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.sku]
}
output "bastion_hosts_tags" {
  description = "List of tags values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.tags]
}
output "bastion_hosts_tunneling_enabled" {
  description = "List of tunneling_enabled values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.tunneling_enabled]
}
output "bastion_hosts_virtual_network_id" {
  description = "List of virtual_network_id values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.virtual_network_id]
}
output "bastion_hosts_zones" {
  description = "List of zones values across all bastion_hosts"
  value       = [for k, v in azurerm_bastion_host.bastion_hosts : v.zones]
}

