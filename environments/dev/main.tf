module "resource_group" {
  source          = "../../module/resource_group"
  resource_groups = var.resource_groups
}

module "acr" {
  source     = "../../module/acr"
  acrs       = var.acrs
  depends_on = [module.resource_group]
}

module "aks" {
  source       = "../../module/aks"
  aks_clusters = var.aks_clusters
  depends_on   = [module.resource_group]
}

# Role assignment to allow AKS to pull from ACR
# This is a bit tricky with maps, so we might need some complex iteration if we want to automate it.
# For now, let's keep it simple as requested.
