output "resource_group_names" {
  value = module.resource_group.resource_group_names
}

output "acr_login_servers" {
  value = module.acr.acr_login_servers
}

output "aks_ids" {
  value = module.aks.aks_ids
}

output "kube_configs" {
  value     = module.aks.kube_configs
  sensitive = true
}
