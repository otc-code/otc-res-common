output "tags" {
  value       = local.tags
  description = "A Map of tags based on the input variables which can be referred from hcl."
}

output "locals" {
  value       = local.locals
  description = "A Map of useful locals based on the input variables which can be referred from hcl."
}

output "sep" {
  value       = local.data.seperator
  description = "The used seperator"
}

output "lc" {
  value       = local.location_codes[var.cloud_region].code
  description = "The Location Code"
}

output "name_prefix" {
  value = local.locals.name_prefix
}