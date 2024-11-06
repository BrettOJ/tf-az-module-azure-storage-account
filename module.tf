# Module file for an Azure Storage account and container

resource "azurerm_storage_account" "azure_storgage_account" {
  name                              = module.sst_name.naming_convention_output[var.naming_convention_info.name].names.0
  resource_group_name               = var.resource_group_name
  location                          = var.location
  account_kind                      = var.account_kind
  account_tier                      = var.account_tier
  account_replication_type          = var.account_replication_type
  cross_tenant_replication_enabled  = var.cross_tenant_replication_enabled
  access_tier                       = var.access_tier
  edge_zone                         = var.edge_zone
  https_traffic_only_enabled        = var.https_traffic_only_enabled
  min_tls_version                   = var.min_tls_version
  allow_nested_items_to_be_public   = var.allow_nested_items_to_be_public
  shared_access_key_enabled         = var.shared_access_key_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  default_to_oauth_authentication   = var.default_to_oauth_authentication
  is_hns_enabled                    = var.is_hns_enabled
  nfsv3_enabled                     = var.nfsv3_enabled
  large_file_share_enabled          = var.large_file_share_enabled
  local_user_enabled                = var.local_user_enabled
  queue_encryption_key_type         = var.queue_encryption_key_type
  table_encryption_key_type         = var.table_encryption_key_type
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  allowed_copy_scope                = var.allowed_copy_scope
  sftp_enabled                      = var.sftp_enabled
  dns_endpoint_type                 = var.dns_endpoint_type
  tags                              = var.tags

  dynamic "custom_domain" {
    for_each = var.custom_domain != null ? [var.custom_domain] : []
    content {
      name          = var.custom_domain.name
      use_subdomain = var.custom_domain.use_subdomain
    }
  }

  dynamic "customer_managed_key" {
    for_each = var.customer_managed_key != null ? [var.customer_managed_key] : []
    content {
      key_vault_key_id          = var.customer_managed_key.key_vault_key_id
      managed_hsm_key_id        = var.customer_managed_key.managed_hsm_key_id
      user_assigned_identity_id = var.customer_managed_key.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.identity_ids
    }
  }

  dynamic "blob_properties" {
    for_each = var.blob_properties != null ? [var.blob_properties] : []
    content {
      cors_rule {
        allowed_headers    = var.blob_properties.cors_rule.allowed_headers
        allowed_methods    = var.blob_properties.cors_rule.allowed_methods
        allowed_origins    = var.blob_properties.cors_rule.allowed_origins
        exposed_headers    = var.blob_properties.cors_rule.exposed_headers
        max_age_in_seconds = var.blob_properties.cors_rule.max_age_in_seconds
      }
      delete_retention_policy {
        days                     = var.blob_properties.delete_retention_policy.days
        permanent_delete_enabled = var.blob_properties.delete_retention_policy.permanent_delete_enabled
      }
      restore_policy {
        days = var.blob_properties.restore_policy.days
      }
      versioning_enabled            = var.blob_properties.versioning_enabled
      change_feed_enabled           = var.blob_properties.change_feed_enabled
      change_feed_retention_in_days = var.blob_properties.change_feed_retention_in_days
      default_service_version       = var.blob_properties.default_service_version
      last_access_time_enabled      = var.blob_properties.last_access_time_enabled
      container_delete_retention_policy {
        days = var.blob_properties.container_delete_retention_policy.days
      }
    }
  }

  dynamic "queue_properties" {
    for_each = var.queue_properties != null ? [var.queue_properties] : []
    content {
      cors_rule {
        allowed_headers    = var.queue_properties.cors_rule.allowed_headers
        allowed_methods    = var.queue_properties.cors_rule.allowed_methods
        allowed_origins    = var.queue_properties.cors_rule.allowed_origins
        exposed_headers    = var.queue_properties.cors_rule.exposed_headers
        max_age_in_seconds = var.queue_properties.cors_rule.max_age_in_seconds
      }
      logging {
        delete                = var.queue_properties.logging.delete
        read                  = var.queue_properties.logging.read
        version               = var.queue_properties.logging.version
        write                 = var.queue_properties.logging.write
        retention_policy_days = var.queue_properties.logging.retention_policy_days
      }
      minute_metrics {
        enabled               = var.queue_properties.minute_metrics.enabled
        version               = var.queue_properties.minute_metrics.version
        include_apis          = var.queue_properties.minute_metrics.include_apis
        retention_policy_days = var.queue_properties.minute_metrics.retention_policy_days
      }
      hour_metrics {
        enabled               = var.queue_properties.hour_metrics.enabled
        version               = var.queue_properties.hour_metrics.version
        include_apis          = var.queue_properties.hour_metrics.include_apis
        retention_policy_days = var.queue_properties.hour_metrics.retention_policy_days
      }
    }
  }

  dynamic "static_website" {
    for_each = var.static_website != null ? [var.static_website] : []
    content {
      index_document     = var.static_website.index_document
      error_404_document = var.static_website.error_404_document
    }
  }

  dynamic "share_properties" {
    for_each = var.share_properties != null ? [var.share_properties] : []
    content {
      cors_rule {
        allowed_headers    = var.share_properties.cors_rule.allowed_headers
        allowed_methods    = var.share_properties.cors_rule.allowed_methods
        allowed_origins    = var.share_properties.cors_rule.allowed_origins
        exposed_headers    = var.share_properties.cors_rule.exposed_headers
        max_age_in_seconds = var.share_properties.cors_rule.max_age_in_seconds
      }
      retention_policy {
        days = var.share_properties.retention_policy.days
      }
      smb {
        versions                        = var.share_properties.smb.versions
        authentication_types            = var.share_properties.smb.authentication_types
        kerberos_ticket_encryption_type = var.share_properties.smb.kerberos_ticket_encryption_type
        channel_encryption_type         = var.share_properties.smb.channel_encryption_type
        multichannel_enabled            = var.share_properties.smb.multichannel_enabled
      }
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules != null ? [var.network_rules] : []
    content {
      default_action             = var.network_rules.default_action
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.virtual_network_subnet_ids
      private_link_access {
        endpoint_resource_id = var.network_rules.private_link_access.endpoint_resource_id
        endpoint_tenant_id   = var.network_rules.private_link_access.endpoint_tenant_id
      }
    }
  }

  dynamic "azure_files_authentication" {
    for_each = var.azure_files_authentication != null ? [var.azure_files_authentication] : []
    content {
      directory_type = var.azure_files_authentication.directory_type
      active_directory {
        domain_name         = var.azure_files_authentication.active_directory.domain_name
        domain_guid         = var.azure_files_authentication.active_directory.domain_guid
        domain_sid          = var.azure_files_authentication.active_directory.domain_sid
        storage_sid         = var.azure_files_authentication.active_directory.storage_sid
        forest_name         = var.azure_files_authentication.active_directory.forest_name
        netbios_domain_name = var.azure_files_authentication.active_directory.netbios_domain_name
      }
      default_share_level_permission = var.azure_files_authentication.default_share_level_permission
    }
  }

  dynamic "routing" {
    for_each = var.routing != null ? [var.routing] : []
    content {
      publish_internet_endpoints  = var.routing.publish_internet_endpoints
      publish_microsoft_endpoints = var.routing.publish_microsoft_endpoints
      choice                      = var.routing.choice
    }
  }

  dynamic "sas_policy" {
    for_each = var.sas_policy != null ? [var.sas_policy] : []
    content {
      expiration_period = var.sas_policy.expiration_period
      expiration_action = var.sas_policy.expiration_action
    }
  }

  dynamic "immutability_policy" {
    for_each = var.immutability_policy != null ? [var.immutability_policy] : []
    content {
      allow_protected_append_writes = var.immutability_policy.allow_protected_append_writes
      state                         = var.immutability_policy.state
      period_since_creation_in_days = var.immutability_policy.period_since_creation_in_days
    }
  }

}

resource "azurerm_storage_container" "ss_cnt_obj" {
  for_each              = var.containers != null ? var.containers : {}
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.azure_storgage_account.name
  container_access_type = each.value.access_type
}
