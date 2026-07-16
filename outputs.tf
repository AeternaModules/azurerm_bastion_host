output "bastion_hosts_id" {
  description = "Map of id values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bastion_hosts_copy_paste_enabled" {
  description = "Map of copy_paste_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.copy_paste_enabled if v.copy_paste_enabled != null }
}
output "bastion_hosts_dns_name" {
  description = "Map of dns_name values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.dns_name if v.dns_name != null && length(v.dns_name) > 0 }
}
output "bastion_hosts_file_copy_enabled" {
  description = "Map of file_copy_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.file_copy_enabled if v.file_copy_enabled != null }
}
output "bastion_hosts_ip_configuration" {
  description = "Map of ip_configuration values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.ip_configuration if v.ip_configuration != null && length(v.ip_configuration) > 0 }
}
output "bastion_hosts_ip_connect_enabled" {
  description = "Map of ip_connect_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.ip_connect_enabled if v.ip_connect_enabled != null }
}
output "bastion_hosts_kerberos_enabled" {
  description = "Map of kerberos_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.kerberos_enabled if v.kerberos_enabled != null }
}
output "bastion_hosts_location" {
  description = "Map of location values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bastion_hosts_name" {
  description = "Map of name values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.name if v.name != null && length(v.name) > 0 }
}
output "bastion_hosts_private_only_enabled" {
  description = "Map of private_only_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.private_only_enabled if v.private_only_enabled != null }
}
output "bastion_hosts_resource_group_name" {
  description = "Map of resource_group_name values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "bastion_hosts_scale_units" {
  description = "Map of scale_units values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.scale_units if v.scale_units != null }
}
output "bastion_hosts_session_recording_enabled" {
  description = "Map of session_recording_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.session_recording_enabled if v.session_recording_enabled != null }
}
output "bastion_hosts_shareable_link_enabled" {
  description = "Map of shareable_link_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.shareable_link_enabled if v.shareable_link_enabled != null }
}
output "bastion_hosts_sku" {
  description = "Map of sku values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "bastion_hosts_tags" {
  description = "Map of tags values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "bastion_hosts_tunneling_enabled" {
  description = "Map of tunneling_enabled values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.tunneling_enabled if v.tunneling_enabled != null }
}
output "bastion_hosts_virtual_network_id" {
  description = "Map of virtual_network_id values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.virtual_network_id if v.virtual_network_id != null && length(v.virtual_network_id) > 0 }
}
output "bastion_hosts_zones" {
  description = "Map of zones values across all bastion_hosts, keyed the same as var.bastion_hosts"
  value       = { for k, v in azurerm_bastion_host.bastion_hosts : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

