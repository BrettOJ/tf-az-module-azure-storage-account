Manages an Azure Storage Account.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_storage_account" "example" { name = "storageaccountname" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location account_tier = "Standard" account_replication_type = "GRS" tags = { environment = "staging" } }
```

## [Example Usage with Network Rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#example-usage-with-network-rules)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_virtual_network" "example" { name = "virtnetname" address_space = ["10.0.0.0/16"] location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name } resource "azurerm_subnet" "example" { name = "subnetname" resource_group_name = azurerm_resource_group.example.name virtual_network_name = azurerm_virtual_network.example.name address_prefixes = ["10.0.2.0/24"] service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"] } resource "azurerm_storage_account" "example" { name = "storageaccountname" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location account_tier = "Standard" account_replication_type = "LRS" network_rules { default_action = "Deny" ip_rules = ["100.0.0.1"] virtual_network_subnet_ids = [azurerm_subnet.example.id] } tags = { environment = "staging" } }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#resource_group_name) - (Required) The name of the resource group in which to create the storage account. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#location) - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.
    
-   [`account_kind`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_kind) - (Optional) Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Defaults to `StorageV2`.
    

-   [`account_tier`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_tier) - (Required) Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created.

-   [`account_replication_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#account_replication_type) - (Required) Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`. Changing this forces a new resource to be created when types `LRS`, `GRS` and `RAGRS` are changed to `ZRS`, `GZRS` or `RAGZRS` and vice versa.
    
-   [`cross_tenant_replication_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cross_tenant_replication_enabled) - (Optional) Should cross Tenant replication be enabled? Defaults to `false`.
    
-   [`access_tier`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#access_tier) - (Optional) Defines the access tier for `BlobStorage`, `FileStorage` and `StorageV2` accounts. Valid options are `Hot` and `Cool`, defaults to `Hot`.
    
-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#edge_zone) - (Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created.
    
-   [`https_traffic_only_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#https_traffic_only_enabled) - (Optional) Boolean flag which forces HTTPS if enabled, see [here](https://docs.microsoft.com/azure/storage/storage-require-secure-transfer/) for more information. Defaults to `true`.
    
-   [`min_tls_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version) - (Optional) The minimum supported TLS version for the storage account. Possible values are `TLS1_0`, `TLS1_1`, and `TLS1_2`. Defaults to `TLS1_2` for new storage accounts.
    

-   [`allow_nested_items_to_be_public`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allow_nested_items_to_be_public) - (Optional) Allow or disallow nested items within this Account to opt into being public. Defaults to `true`.

-   [`shared_access_key_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#shared_access_key_enabled) - (Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). Defaults to `true`.

-   [`public_network_access_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#public_network_access_enabled) - (Optional) Whether the public network access is enabled? Defaults to `true`.
    
-   [`default_to_oauth_authentication`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#default_to_oauth_authentication) - (Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is `false`
    
-   [`is_hns_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#is_hns_enabled) - (Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 ([see here for more information](https://docs.microsoft.com/azure/storage/blobs/data-lake-storage-quickstart-create-account/)). Changing this forces a new resource to be created.
    

-   [`nfsv3_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#nfsv3_enabled) - (Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to `false`.

-   [`custom_domain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#custom_domain) - (Optional) A `custom_domain` block as documented below.
    
-   [`customer_managed_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#customer_managed_key) - (Optional) A `customer_managed_key` block as documented below.
    

-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#identity) - (Optional) An `identity` block as defined below.
    
-   [`blob_properties`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#blob_properties) - (Optional) A `blob_properties` block as defined below.
    
-   [`queue_properties`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#queue_properties) - (Optional) A `queue_properties` block as defined below.
    

-   [`static_website`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#static_website) - (Optional) A `static_website` block as defined below.

-   [`share_properties`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#share_properties) - (Optional) A `share_properties` block as defined below.

-   [`network_rules`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#network_rules) - (Optional) A `network_rules` block as documented below.
    
-   [`large_file_share_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#large_file_share_enabled) - (Optional) Are Large File Shares Enabled? Defaults to `false`.
    

-   [`local_user_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#local_user_enabled) - (Optional) Is Local User Enabled? Defaults to `true`.
    
-   [`azure_files_authentication`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#azure_files_authentication) - (Optional) A `azure_files_authentication` block as defined below.
    
-   [`routing`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#routing) - (Optional) A `routing` block as defined below.
    
-   [`queue_encryption_key_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#queue_encryption_key_type) - (Optional) The encryption type of the queue service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`.
    
-   [`table_encryption_key_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#table_encryption_key_type) - (Optional) The encryption type of the table service. Possible values are `Service` and `Account`. Changing this forces a new resource to be created. Default value is `Service`.
    

-   [`infrastructure_encryption_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#infrastructure_encryption_enabled) - (Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to `false`.

-   [`immutability_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#immutability_policy) - (Optional) An `immutability_policy` block as defined below. Changing this forces a new resource to be created.
    
-   [`sas_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#sas_policy) - (Optional) A `sas_policy` block as defined below.
    
-   [`allowed_copy_scope`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allowed_copy_scope) - (Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are `AAD` and `PrivateLink`.
    
-   [`sftp_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#sftp_enabled) - (Optional) Boolean, enable SFTP for the storage account
    

-   [`dns_endpoint_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#dns_endpoint_type) - (Optional) Specifies which DNS endpoint type to use. Possible values are `Standard` and `AzureDnsZone`. Defaults to `Standard`. Changing this forces a new resource to be created.

-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#tags) - (Optional) A mapping of tags to assign to the resource.

___

A `blob_properties` block supports the following:

-   [`cors_rule`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) - (Optional) A `cors_rule` block as defined below.
    
-   [`delete_retention_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#delete_retention_policy) - (Optional) A `delete_retention_policy` block as defined below.
    
-   [`restore_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#restore_policy) - (Optional) A `restore_policy` block as defined below. This must be used together with `delete_retention_policy` set, `versioning_enabled` and `change_feed_enabled` set to `true`.
    

-   [`versioning_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#versioning_enabled) - (Optional) Is versioning enabled? Default to `false`.

-   [`change_feed_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#change_feed_enabled) - (Optional) Is the blob service properties for change feed events enabled? Default to `false`.

-   [`change_feed_retention_in_days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#change_feed_retention_in_days) - (Optional) The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years). Setting this to null (or omit this in the configuration file) indicates an infinite retention of the change feed.

-   [`default_service_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#default_service_version) - (Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version.
    
-   [`last_access_time_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#last_access_time_enabled) - (Optional) Is the last access time based tracking enabled? Default to `false`.
    

-   [`container_delete_retention_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#container_delete_retention_policy) - (Optional) A `container_delete_retention_policy` block as defined below.

___

A `cors_rule` block supports the following:

-   [`allowed_headers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allowed_headers) - (Required) A list of headers that are allowed to be a part of the cross-origin request.
    
-   [`allowed_methods`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allowed_methods) - (Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are `DELETE`, `GET`, `HEAD`, `MERGE`, `POST`, `OPTIONS`, `PUT` or `PATCH`.
    
-   [`allowed_origins`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allowed_origins) - (Required) A list of origin domains that will be allowed by CORS.
    
-   [`exposed_headers`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#exposed_headers) - (Required) A list of response headers that are exposed to CORS clients.
    
-   [`max_age_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#max_age_in_seconds) - (Required) The number of seconds the client should cache a preflight response.
    

___

A `custom_domain` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#name) - (Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure.
    
-   [`use_subdomain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#use_subdomain) - (Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?
    

___

A `customer_managed_key` block supports the following:

-   [`key_vault_key_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#key_vault_key_id) - (Optional) The ID of the Key Vault Key, supplying a version-less key ID will enable auto-rotation of this key. Exactly one of `key_vault_key_id` and `managed_hsm_key_id` may be specified.
    
-   [`managed_hsm_key_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#managed_hsm_key_id) - (Optional) The ID of the managed HSM Key. Exactly one of `key_vault_key_id` and `managed_hsm_key_id` may be specified.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#user_assigned_identity_id) - (Required) The ID of a user assigned identity.
    

___

A `delete_retention_policy` block supports the following:

-   [`days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#days) - (Optional) Specifies the number of days that the blob should be retained, between `1` and `365` days. Defaults to `7`.
    
-   [`permanent_delete_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#permanent_delete_enabled) - (Optional) Indicates whether permanent deletion of the soft deleted blob versions and snapshots is allowed. Defaults to `false`.
    

___

A `restore_policy` block supports the following:

-   [`days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#days) - (Required) Specifies the number of days that the blob can be restored, between `1` and `365` days. This must be less than the `days` specified for `delete_retention_policy`.

___

A `container_delete_retention_policy` block supports the following:

-   [`days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#days) - (Optional) Specifies the number of days that the container should be retained, between `1` and `365` days. Defaults to `7`.

___

A `hour_metrics` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#enabled) - (Required) Indicates whether hour metrics are enabled for the Queue service.
    
-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#version) - (Required) The version of storage analytics to configure.
    
-   [`include_apis`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#include_apis) - (Optional) Indicates whether metrics should generate summary statistics for called API operations.
    
-   [`retention_policy_days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#retention_policy_days) - (Optional) Specifies the number of days that logs will be retained.
    

___

An `identity` block supports the following:

-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#type) - (Required) Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both).
    
-   [`identity_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#identity_ids) - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Storage Account.
    

___

An `immutability_policy` block supports the following:

-   [`allow_protected_append_writes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#allow_protected_append_writes) - (Required) When enabled, new blocks can be written to an append blob while maintaining immutability protection and compliance. Only new blocks can be added and any existing blocks cannot be modified or deleted.
    
-   [`state`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#state) - (Required) Defines the mode of the policy. `Disabled` state disables the policy, `Unlocked` state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property, `Locked` state only allows the increase of the immutability retention time. A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted.
    
-   [`period_since_creation_in_days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#period_since_creation_in_days) - (Required) The immutability period for the blobs in the container since the policy creation, in days.
    

___

A `logging` block supports the following:

-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#delete) - (Required) Indicates whether all delete requests should be logged.
    
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#read) - (Required) Indicates whether all read requests should be logged.
    
-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#version) - (Required) The version of storage analytics to configure.
    
-   [`write`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#write) - (Required) Indicates whether all write requests should be logged.
    
-   [`retention_policy_days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#retention_policy_days) - (Optional) Specifies the number of days that logs will be retained.
    

___

A `minute_metrics` block supports the following:

-   [`enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#enabled) - (Required) Indicates whether minute metrics are enabled for the Queue service.
    
-   [`version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#version) - (Required) The version of storage analytics to configure.
    
-   [`include_apis`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#include_apis) - (Optional) Indicates whether metrics should generate summary statistics for called API operations.
    
-   [`retention_policy_days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#retention_policy_days) - (Optional) Specifies the number of days that logs will be retained.
    

___

A `network_rules` block supports the following:

-   [`default_action`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#default_action) - (Required) Specifies the default action of allow or deny when no other rules match. Valid options are `Deny` or `Allow`.
    
-   [`bypass`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#bypass) - (Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of `Logging`, `Metrics`, `AzureServices`, or `None`.
    
-   [`ip_rules`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#ip_rules) - (Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. /31 CIDRs, /32 CIDRs, and Private IP address ranges (as defined in [RFC 1918](https://tools.ietf.org/html/rfc1918#section-3)), are not allowed.
    
-   [`virtual_network_subnet_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#virtual_network_subnet_ids) - (Optional) A list of resource ids for subnets.
    
-   [`private_link_access`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#private_link_access) - (Optional) One or more `private_link_access` block as defined below.
    

___

A `private_link_access` block supports the following:

-   [`endpoint_resource_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#endpoint_resource_id) - (Required) The ID of the Azure resource that should be allowed access to the target storage account.
    
-   [`endpoint_tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#endpoint_tenant_id) - (Optional) The tenant id of the resource of the resource access rule to be granted access. Defaults to the current tenant id.
    

___

A `azure_files_authentication` block supports the following:

-   [`directory_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#directory_type) - (Required) Specifies the directory service used. Possible values are `AADDS`, `AD` and `AADKERB`.
    
-   [`active_directory`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#active_directory) - (Optional) A `active_directory` block as defined below. Required when `directory_type` is `AD`.
    
-   [`default_share_level_permission`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#default_share_level_permission) - (Optional) Specifies the default share level permissions applied to all users. Possible values are `StorageFileDataSmbShareReader`, `StorageFileDataSmbShareContributor`, `StorageFileDataSmbShareElevatedContributor`, or `None`.
    

___

A `active_directory` block supports the following:

-   [`domain_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#domain_name) - (Required) Specifies the primary domain that the AD DNS server is authoritative for.
    
-   [`domain_guid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#domain_guid) - (Required) Specifies the domain GUID.
    
-   [`domain_sid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#domain_sid) - (Optional) Specifies the security identifier (SID). This is required when `directory_type` is set to `AD`.
    
-   [`storage_sid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#storage_sid) - (Optional) Specifies the security identifier (SID) for Azure Storage. This is required when `directory_type` is set to `AD`.
    
-   [`forest_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#forest_name) - (Optional) Specifies the Active Directory forest. This is required when `directory_type` is set to `AD`.
    
-   [`netbios_domain_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#netbios_domain_name) - (Optional) Specifies the NetBIOS domain name. This is required when `directory_type` is set to `AD`.
    

___

A `routing` block supports the following:

-   [`publish_internet_endpoints`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#publish_internet_endpoints) - (Optional) Should internet routing storage endpoints be published? Defaults to `false`.
    
-   [`publish_microsoft_endpoints`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#publish_microsoft_endpoints) - (Optional) Should Microsoft routing storage endpoints be published? Defaults to `false`.
    
-   [`choice`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#choice) - (Optional) Specifies the kind of network routing opted by the user. Possible values are `InternetRouting` and `MicrosoftRouting`. Defaults to `MicrosoftRouting`.
    

___

A `queue_properties` block supports the following:

-   [`cors_rule`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) - (Optional) A `cors_rule` block as defined above.
    
-   [`logging`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#logging) - (Optional) A `logging` block as defined below.
    
-   [`minute_metrics`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#minute_metrics) - (Optional) A `minute_metrics` block as defined below.
    
-   [`hour_metrics`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#hour_metrics) - (Optional) A `hour_metrics` block as defined below.
    

___

A `sas_policy` block supports the following:

-   [`expiration_period`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#expiration_period) - (Required) The SAS expiration period in format of `DD.HH:MM:SS`.
    
-   [`expiration_action`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#expiration_action) - (Optional) The SAS expiration action. The only possible value is `Log` at this moment. Defaults to `Log`.
    

___

A `static_website` block supports the following:

-   [`index_document`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#index_document) - (Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.
    
-   [`error_404_document`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#error_404_document) - (Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.
    

___

A `share_properties` block supports the following:

-   [`cors_rule`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule) - (Optional) A `cors_rule` block as defined below.
    
-   [`retention_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#retention_policy) - (Optional) A `retention_policy` block as defined below.
    
-   [`smb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#smb) - (Optional) A `smb` block as defined below.
    

___

A `retention_policy` block supports the following:

-   [`days`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#days) - (Optional) Specifies the number of days that the `azurerm_storage_share` should be retained, between `1` and `365` days. Defaults to `7`.

___

A `smb` block supports the following:

-   [`versions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#versions) - (Optional) A set of SMB protocol versions. Possible values are `SMB2.1`, `SMB3.0`, and `SMB3.1.1`.
    
-   [`authentication_types`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#authentication_types) - (Optional) A set of SMB authentication methods. Possible values are `NTLMv2`, and `Kerberos`.
    
-   [`kerberos_ticket_encryption_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#kerberos_ticket_encryption_type) - (Optional) A set of Kerberos ticket encryption. Possible values are `RC4-HMAC`, and `AES-256`.
    
-   [`channel_encryption_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#channel_encryption_type) - (Optional) A set of SMB channel encryption. Possible values are `AES-128-CCM`, `AES-128-GCM`, and `AES-256-GCM`.
    
-   [`multichannel_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#multichannel_enabled) - (Optional) Indicates whether multichannel is enabled. Defaults to `false`. This is only supported on Premium storage accounts.
    

___

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#id) - The ID of the Storage Account.
    
-   [`primary_location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_location) - The primary location of the storage account.
    
-   [`secondary_location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_location) - The secondary location of the storage account.
    
-   [`primary_blob_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_endpoint) - The endpoint URL for blob storage in the primary location.
    
-   [`primary_blob_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_host) - The hostname with port if applicable for blob storage in the primary location.
    
-   [`primary_blob_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_internet_endpoint) - The internet routing endpoint URL for blob storage in the primary location.
    
-   [`primary_blob_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_internet_host) - The internet routing hostname with port if applicable for blob storage in the primary location.
    
-   [`primary_blob_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_microsoft_endpoint) - The microsoft routing endpoint URL for blob storage in the primary location.
    
-   [`primary_blob_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_microsoft_host) - The microsoft routing hostname with port if applicable for blob storage in the primary location.
    
-   [`secondary_blob_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_endpoint) - The endpoint URL for blob storage in the secondary location.
    
-   [`secondary_blob_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_host) - The hostname with port if applicable for blob storage in the secondary location.
    
-   [`secondary_blob_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_internet_endpoint) - The internet routing endpoint URL for blob storage in the secondary location.
    
-   [`secondary_blob_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_internet_host) - The internet routing hostname with port if applicable for blob storage in the secondary location.
    
-   [`secondary_blob_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_microsoft_endpoint) - The microsoft routing endpoint URL for blob storage in the secondary location.
    
-   [`secondary_blob_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_microsoft_host) - The microsoft routing hostname with port if applicable for blob storage in the secondary location.
    
-   [`primary_queue_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_queue_endpoint) - The endpoint URL for queue storage in the primary location.
    
-   [`primary_queue_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_queue_host) - The hostname with port if applicable for queue storage in the primary location.
    
-   [`primary_queue_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_queue_microsoft_endpoint) - The microsoft routing endpoint URL for queue storage in the primary location.
    
-   [`primary_queue_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_queue_microsoft_host) - The microsoft routing hostname with port if applicable for queue storage in the primary location.
    
-   [`secondary_queue_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_queue_endpoint) - The endpoint URL for queue storage in the secondary location.
    
-   [`secondary_queue_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_queue_host) - The hostname with port if applicable for queue storage in the secondary location.
    
-   [`secondary_queue_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_queue_microsoft_endpoint) - The microsoft routing endpoint URL for queue storage in the secondary location.
    
-   [`secondary_queue_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_queue_microsoft_host) - The microsoft routing hostname with port if applicable for queue storage in the secondary location.
    
-   [`primary_table_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_table_endpoint) - The endpoint URL for table storage in the primary location.
    
-   [`primary_table_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_table_host) - The hostname with port if applicable for table storage in the primary location.
    
-   [`primary_table_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_table_microsoft_endpoint) - The microsoft routing endpoint URL for table storage in the primary location.
    
-   [`primary_table_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_table_microsoft_host) - The microsoft routing hostname with port if applicable for table storage in the primary location.
    
-   [`secondary_table_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_table_endpoint) - The endpoint URL for table storage in the secondary location.
    
-   [`secondary_table_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_table_host) - The hostname with port if applicable for table storage in the secondary location.
    
-   [`secondary_table_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_table_microsoft_endpoint) - The microsoft routing endpoint URL for table storage in the secondary location.
    
-   [`secondary_table_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_table_microsoft_host) - The microsoft routing hostname with port if applicable for table storage in the secondary location.
    
-   [`primary_file_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_endpoint) - The endpoint URL for file storage in the primary location.
    
-   [`primary_file_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_host) - The hostname with port if applicable for file storage in the primary location.
    
-   [`primary_file_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_internet_endpoint) - The internet routing endpoint URL for file storage in the primary location.
    
-   [`primary_file_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_internet_host) - The internet routing hostname with port if applicable for file storage in the primary location.
    
-   [`primary_file_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_microsoft_endpoint) - The microsoft routing endpoint URL for file storage in the primary location.
    
-   [`primary_file_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_file_microsoft_host) - The microsoft routing hostname with port if applicable for file storage in the primary location.
    
-   [`secondary_file_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_endpoint) - The endpoint URL for file storage in the secondary location.
    
-   [`secondary_file_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_host) - The hostname with port if applicable for file storage in the secondary location.
    
-   [`secondary_file_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_internet_endpoint) - The internet routing endpoint URL for file storage in the secondary location.
    
-   [`secondary_file_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_internet_host) - The internet routing hostname with port if applicable for file storage in the secondary location.
    
-   [`secondary_file_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_microsoft_endpoint) - The microsoft routing endpoint URL for file storage in the secondary location.
    
-   [`secondary_file_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_file_microsoft_host) - The microsoft routing hostname with port if applicable for file storage in the secondary location.
    
-   [`primary_dfs_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_endpoint) - The endpoint URL for DFS storage in the primary location.
    
-   [`primary_dfs_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_host) - The hostname with port if applicable for DFS storage in the primary location.
    
-   [`primary_dfs_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_internet_endpoint) - The internet routing endpoint URL for DFS storage in the primary location.
    
-   [`primary_dfs_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_internet_host) - The internet routing hostname with port if applicable for DFS storage in the primary location.
    
-   [`primary_dfs_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_microsoft_endpoint) - The microsoft routing endpoint URL for DFS storage in the primary location.
    
-   [`primary_dfs_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_dfs_microsoft_host) - The microsoft routing hostname with port if applicable for DFS storage in the primary location.
    
-   [`secondary_dfs_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_endpoint) - The endpoint URL for DFS storage in the secondary location.
    
-   [`secondary_dfs_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_host) - The hostname with port if applicable for DFS storage in the secondary location.
    
-   [`secondary_dfs_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_internet_endpoint) - The internet routing endpoint URL for DFS storage in the secondary location.
    
-   [`secondary_dfs_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_internet_host) - The internet routing hostname with port if applicable for DFS storage in the secondary location.
    
-   [`secondary_dfs_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_microsoft_endpoint) - The microsoft routing endpoint URL for DFS storage in the secondary location.
    
-   [`secondary_dfs_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_dfs_microsoft_host) - The microsoft routing hostname with port if applicable for DFS storage in the secondary location.
    
-   [`primary_web_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_endpoint) - The endpoint URL for web storage in the primary location.
    
-   [`primary_web_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_host) - The hostname with port if applicable for web storage in the primary location.
    
-   [`primary_web_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_internet_endpoint) - The internet routing endpoint URL for web storage in the primary location.
    
-   [`primary_web_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_internet_host) - The internet routing hostname with port if applicable for web storage in the primary location.
    
-   [`primary_web_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_microsoft_endpoint) - The microsoft routing endpoint URL for web storage in the primary location.
    
-   [`primary_web_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_web_microsoft_host) - The microsoft routing hostname with port if applicable for web storage in the primary location.
    
-   [`secondary_web_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_endpoint) - The endpoint URL for web storage in the secondary location.
    
-   [`secondary_web_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_host) - The hostname with port if applicable for web storage in the secondary location.
    
-   [`secondary_web_internet_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_internet_endpoint) - The internet routing endpoint URL for web storage in the secondary location.
    
-   [`secondary_web_internet_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_internet_host) - The internet routing hostname with port if applicable for web storage in the secondary location.
    
-   [`secondary_web_microsoft_endpoint`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_microsoft_endpoint) - The microsoft routing endpoint URL for web storage in the secondary location.
    
-   [`secondary_web_microsoft_host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_web_microsoft_host) - The microsoft routing hostname with port if applicable for web storage in the secondary location.
    
-   [`primary_access_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_access_key) - The primary access key for the storage account.
    
-   [`secondary_access_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_access_key) - The secondary access key for the storage account.
    
-   [`primary_connection_string`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_connection_string) - The connection string associated with the primary location.
    
-   [`secondary_connection_string`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_connection_string) - The connection string associated with the secondary location.
    
-   [`primary_blob_connection_string`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#primary_blob_connection_string) - The connection string associated with the primary blob location.
    
-   [`secondary_blob_connection_string`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#secondary_blob_connection_string) - The connection string associated with the secondary blob location.
    

-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#identity) - An `identity` block as defined below.

___

An `identity` block exports the following:

-   [`principal_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#principal_id) - The Principal ID for the Service Principal associated with the Identity of this Storage Account.
    
-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#tenant_id) - The Tenant ID for the Service Principal associated with the Identity of this Storage Account.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#create) - (Defaults to 60 minutes) Used when creating the Storage Account.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#update) - (Defaults to 60 minutes) Used when updating the Storage Account.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#read) - (Defaults to 5 minutes) Used when retrieving the Storage Account.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#delete) - (Defaults to 60 minutes) Used when deleting the Storage Account.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#import)

Storage Accounts can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_storage_account.storageAcc1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.Storage/storageAccounts/myaccount
```