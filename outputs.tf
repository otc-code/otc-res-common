output "tags" {
  value       = local.tags
  description = "A Map of tags based on the input variables which can be referred from hcl."
}

output "locals" {
  value       = local.locals
  description = "A Map of useful locals based on the input variables which can be referred from hcl."
}
