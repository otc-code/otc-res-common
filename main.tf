locals {
  location_codes = jsondecode(file("${path.module}/templates/location_codes.json"))
  data           = jsondecode(file("${path.module}/templates/data.json"))
  locals = jsondecode(templatefile("${path.module}/templates/locals.json.tpl", {
    s               = local.data.seperator
    location_code   = local.location_codes[var.cloud_region].code
    env             = var.global_config.env
    customer_prefix = var.global_config.customer_prefix == "" ? resource.random_string.customer_prefix[0].result : var.global_config.customer_prefix
    project         = var.global_config.project
    application     = var.global_config.application
    costcenter      = var.global_config.costcenter
    custom_name     = var.custom_name
    module_version  = var.module_version
  }))
  tags = merge(var.custom_tags, local.locals.global_tags)
}

resource "random_string" "customer_prefix" {
  count = length(var.global_config.customer_prefix) == 0 ? 1 : 0
  keepers = {
    env             = var.global_config.env,
    location_code   = local.location_codes[var.cloud_region].code,
    customer_prefix = var.global_config.customer_prefix,
    project         = var.global_config.project,
    application     = var.global_config.application,
    custom_name     = var.custom_name
  }
  length  = 4
  lower   = true
  numeric = true
  upper   = false
  special = false
}

