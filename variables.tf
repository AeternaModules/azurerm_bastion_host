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
    copy_paste_enabled        = optional(bool)   # Default: true
    file_copy_enabled         = optional(bool)   # Default: false
    ip_connect_enabled        = optional(bool)   # Default: false
    kerberos_enabled          = optional(bool)   # Default: false
    scale_units               = optional(number) # Default: 2
    session_recording_enabled = optional(bool)   # Default: false
    shareable_link_enabled    = optional(bool)   # Default: false
    sku                       = optional(string) # Default: "Basic"
    tags                      = optional(map(string))
    tunneling_enabled         = optional(bool) # Default: false
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
        v.scale_units == null || (v.scale_units >= 2 && v.scale_units <= 50)
      )
    ])
    error_message = "must be between 2 and 50"
  }
  validation {
    condition = alltrue([
      for k, v in var.bastion_hosts : (
        v.zones == null || (length(v.zones) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_bastion_host's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.BastionHostName] !regexp.MustCompile(`^[A-Za-z0-9][a-zA-Z0-9_.-]+[a-zA-Z0-9_]$`).MatchString(value)
  # path: name
  #   source:    [from validate.BastionHostName] 1 > len(value)
  # path: name
  #   condition: length(value) <= 80
  #   message:   [from validate.BastionHostName: invalid when len(value) > 80]
  #   source:    [from validate.BastionHostName: invalid when len(value) > 80]
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: ip_configuration.name
  #   source:    [from validate.BastionIPConfigName] !regexp.MustCompile(`^[A-Za-z0-9][a-zA-Z0-9_.-]+[a-zA-Z0-9_]$`).MatchString(value)
  # path: ip_configuration.name
  #   source:    [from validate.BastionIPConfigName] 1 > len(value)
  # path: ip_configuration.name
  #   condition: length(value) <= 80
  #   message:   [from validate.BastionIPConfigName: invalid when len(value) > 80]
  #   source:    [from validate.BastionIPConfigName: invalid when len(value) > 80]
  # path: ip_configuration.subnet_id
  #   source:    [from validate.BastionSubnetName] err != nil
  # path: ip_configuration.subnet_id
  #   source:    [from validate.BastionSubnetName] parsed.SubnetName != "AzureBastionSubnet"
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: virtual_network_id
  #   source:    [from commonids.ValidateVirtualNetworkID] !ok
  # path: virtual_network_id
  #   source:    [from commonids.ValidateVirtualNetworkID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

