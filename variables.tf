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
        - public_ip_address_id (optional)
        - subnet_id (required)
EOT

  type = map(object({
    location                  = string
    name                      = string
    resource_group_name       = string
    copy_paste_enabled        = optional(bool)
    file_copy_enabled         = optional(bool)
    ip_connect_enabled        = optional(bool)
    kerberos_enabled          = optional(bool)
    scale_units               = optional(number)
    session_recording_enabled = optional(bool)
    shareable_link_enabled    = optional(bool)
    sku                       = optional(string)
    tags                      = optional(map(string))
    tunneling_enabled         = optional(bool)
    virtual_network_id        = optional(string)
    zones                     = optional(set(string))
    ip_configuration = optional(object({
      name                 = string
      public_ip_address_id = optional(string)
      subnet_id            = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        length(v.name) <= 80
      )
    ])
    error_message = "[from validate.BastionHostName: invalid when len(value) > 80]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        v.ip_configuration == null || (length(v.ip_configuration.name) <= 80)
      )
    ])
    error_message = "[from validate.BastionIPConfigName: invalid when len(value) > 80]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        v.scale_units == null || (v.scale_units >= 2 && v.scale_units <= 50)
      )
    ])
    error_message = "must be between 2 and 50"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        v.zones == null || (alltrue([for x in v.zones : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 16 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

