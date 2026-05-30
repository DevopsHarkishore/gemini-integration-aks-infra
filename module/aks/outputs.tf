output "aks_ids" {
  description = "IDs of the created AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
}

output "aks_names" {
  description = "Names of the created AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.name }
}

output "kube_configs" {
  description = "Kube configs of the created AKS clusters"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.kube_config_raw }
  sensitive   = true
}

output "aks_identities" {
  description = "Principal IDs of the AKS clusters' system-assigned identities"
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.identity[0].principal_id if length(v.identity) > 0 }
}
