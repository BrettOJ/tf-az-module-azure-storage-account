variable "location" {
  type    = string
  default = "southeastasia"

}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
}

variable "account_kind" {
  type        = string
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2."
  default     = "StorageV2"
}

variable "account_tier" {
  type        = string
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  default     = "LRS"
}

variable "cross_tenant_replication_enabled" {
  type        = bool
  description = "(Optional) Should cross Tenant replication be enabled? Defaults to false."
  default     = false
}

variable "access_tier" {
  type        = string
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  default     = "Hot"
}

variable "edge_zone" {
  type        = string
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  default     = null
}

variable "https_traffic_only_enabled" {
  type        = bool
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true."
  default     = true
}

variable "min_tls_version" {
  type        = string
  description = "(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts."
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "(Optional) Allow or disallow nested items within this Account to opt into being public. Defaults to true."
  default     = true
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "(Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to true."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Whether the public network access is enabled? Defaults to true."
  default     = true
}

variable "default_to_oauth_authentication" {
  type        = bool
  description = "(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false"
  default     = false
}

variable "is_hns_enabled" {
  type        = bool
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 (see here for more information). Changing this forces a new resource to be created."
  default     = false
}

variable "nfsv3_enabled" {
  type        = bool
  description = "(Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to false."
  default     = false
}

variable "large_file_share_enabled" {
  type        = bool
  description = "(Optional) Are Large File Shares Enabled? Defaults to false."
  default     = false
}

variable "local_user_enabled" {
  type        = bool
  description = "(Optional) Is Local User Enabled? Defaults to true."
  default     = true
}

variable "queue_encryption_key_type" {
  type        = string
  description = "(Optional) The encryption type of the queue service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service."
  default     = "Service"
}

variable "table_encryption_key_type" {
  type        = string
  description = "(Optional) The encryption type of the table service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service."
  default     = "Service"
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "(Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false."
  default     = false
}

variable "allowed_copy_scope" {
  type        = string
  description = "(Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink."
  default     = null
}

variable "sftp_enabled" {
  type        = bool
  description = "(Optional) Boolean, enable SFTP for the storage account"
  default     = false
}

variable "dns_endpoint_type" {
  type        = string
  description = "(Optional) Specifies which DNS endpoint type to use. Possible values are Standard and AzureDnsZone. Defaults to Standard. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
}

variable "custom_domain" {
  type = object({
    name          = string
    use_subdomain = bool
  })
  description = "(Optional) A custom_domain block as defined below."
  default     = null
}

variable "customer_managed_key" {
  type = object({
    key_vault_key_id          = string
    managed_hsm_key_id        = string
    user_assigned_identity_id = string
  })
  description = "(Optional) A customer_managed_key block as defined below."
  default     = null
}
variable "identity" {
  type = object({
    type         = string
    identity_ids = list(string)
  })
  description = "(Optional) An identity block as defined below."
  default     = null
}

variable "blob_properties" {
  type = object({
    cors_rule = list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    }))
    delete_retention_policy = object({
      days                     = number
      permanent_delete_enabled = bool
    })
    restore_policy = object({
      days = number
    })
    versioning_enabled            = bool
    change_feed_enabled           = bool
    change_feed_retention_in_days = number
    default_service_version       = string
    last_access_time_enabled      = bool
    container_delete_retention_policy = object({
      days = number
    })
  })
  description = "(Optional) A blob_properties block as defined below."
  default     = null
}

variable "queue_properties" {
  type = object({
    cors_rule = list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    }))
    logging = object({
      delete                = bool
      read                  = bool
      version               = string
      write                 = bool
      retention_policy_days = number
    })
    minute_metrics = object({
      enabled               = bool
      version               = string
      include_apis          = bool
      retention_policy_days = number
    })
    hour_metrics = object({
      enabled               = bool
      version               = string
      include_apis          = bool
      retention_policy_days = number
    })
  })
  description = "(Optional) A queue_properties block as defined below."
  default     = null
}

variable "static_website" {
  type = object({
    index_document     = string
    error_404_document = string
  })
  description = "(Optional) A static_website block as defined below."
  default     = null
}

variable "share_properties" {
  type = object({
    cors_rule = list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    }))
    retention_policy = object({
      days = number
    })
    smb = object({
      versions                        = list(string)
      authentication_types            = list(string)
      kerberos_ticket_encryption_type = string
      channel_encryption_type         = string
      multichannel_enabled            = bool
    })
  })
  description = "(Optional) A share_properties block as defined below."
  default     = null
}

variable "network_rules" {
  type = object({
    default_action             = string
    bypass                     = list(string)
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
    private_link_access = list(object({
      endpoint_resource_id = string
      endpoint_tenant_id   = string
    }))
  })
  description = "(Optional) A network_rules block as defined below."
  default     = null

}

variable "private_link_access" {
  type = object({
    endpoint_resource_id = string
    endpoint_tenant_id   = string
  })
  description = "(Optional) A private_link_access block as defined below."
  default     = null
}

variable "azure_files_authentication" {
  type = object({
    directory_type = string
    active_directory = object({
      domain_name         = string
      domain_guid         = string
      domain_sid          = string
      storage_sid         = string
      forest_name         = string
      netbios_domain_name = string
    })
    default_share_level_permission = string
  })
  description = "(Optional) A azure_files_authentication block as defined below."
  default     = null

}

variable "routing" {
  type = object({
    publish_internet_endpoints  = bool
    publish_microsoft_endpoints = bool
    choice                      = string
  })
  description = "(Optional) A routing block as defined below."
  default     = null

}

variable "sas_policy" {
  type = object({
    expiration_period = string
    expiration_action = string
  })
  description = "(Optional) A sas_policy block as defined below."
  default     = null
}

variable "immutability_policy" {
  type = object({
    allow_protected_append_writes = bool
    state                         = string
    period_since_creation_in_days = number
  })
  description = "(Optional) An immutability_policy block as defined below."
  default     = null

}

variable "logging" {
  type = object({
    delete                = bool
    read                  = bool
    version               = string
    write                 = bool
    retention_policy_days = number
  })
  description = "(Optional) A logging block as defined below."
  default     = null
}

variable "containers" {
  type = map(object({
    name        = string
    access_type = string
  }))
  default     = null
  description = "List of storage containers."

}

variable "naming_convention_info" {
  type = object({
    name         = string
    site         = string
    env          = string
    app          = string
  })
  description = "Naming convention information."
}