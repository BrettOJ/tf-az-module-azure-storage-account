#storage account name
module "sst_name" {
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|site|env|app|name"
  naming_convention_info = {
    "${var.naming_convention_info.name}" = {
      name_info = var.naming_convention_info
      tags      = var.tags
    }
  }
  resource_type = "st"
}

#storage account container name
module "sst_cnt_name" {
  for_each = var.containers != null ? var.containers : {}
  
  source      = "git::https://github.com/BrettOJ/tf-az-module-naming-convention?ref=main"
  name_format = "res_type|-|site|-|env|app|-|name"
  naming_convention_info = {
    for key, value in var.containers :
    "${key}" => {
      name_info = merge(var.naming_convention_info, { name = key })
      tags      = var.tags
    }
  }
  resource_type = "blob"
}

