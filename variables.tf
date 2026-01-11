variable "bastion_hosts" {
  description = <<EOT
Map of bastion_hosts, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - copy_paste_enabled
    - file_copy_enabled
    - ip_connect_enabled
    - kerberos_enabled
    - scale_units
    - session_recording_enabled
    - shareable_link_enabled
    - sku
    - tags
    - tunneling_enabled
    - virtual_network_id
    - zones
    - ip_configuration (block):
        - name (required)
        - public_ip_address_id (required)
        - subnet_id (required)
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    copy_paste_enabled        = optional(bool, true)
    file_copy_enabled         = optional(bool, false)
    ip_connect_enabled        = optional(bool, false)
    kerberos_enabled          = optional(bool, false)
    scale_units               = optional(number, 2)
    session_recording_enabled = optional(bool, false)
    shareable_link_enabled    = optional(bool, false)
    sku                       = optional(string, "Basic")
    tags                      = optional(map(string))
    tunneling_enabled         = optional(bool, false)
    virtual_network_id        = optional(string)
    zones                     = optional(set(string))
    ip_configuration = optional(object({
      name                 = string
      public_ip_address_id = string
      subnet_id            = string
    }))
  }))
}

