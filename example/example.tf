
locals {
  tags = {
    "created-by" = "Terraform"

  }

  naming_convention_info = {
    name         = "001"
    site = "knj"
    env          = "dev"
    app         = "z1"
  }
}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}



module "l0_storage_account" {
  source                 = "../"
  resource_group_name    = module.resource_groups.rg_output.1.name
  location               = var.location
  account_kind           = "StorageV2"
  account_tier           = "Standard"
  min_tls_version        = "TLS1_2"
  tags                   = local.tags
  naming_convention_info = local.naming_convention_info
  share_properties       = null

  containers = {
    lvl0 = {
      name        = "lvl0"
      access_type = "private"
    }
    lvl1 = {
      name        = "lvl1"
      access_type = "private"
    }
    lvl2 = {
      name        = "lvl2"
      access_type = "private"
    }
  }

}
