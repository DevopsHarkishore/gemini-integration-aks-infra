resource_groups = {
  "rg-dev-nithin" = {
    location = "East US"
    tags = {
      environment = "dev"
      owner       = "nithin"
    }
  }
}

acrs = {
  "acrdevnithin7338" = {
    resource_group_name = "rg-dev-nithin"
    location            = "East US"
    sku                 = "Basic"
    admin_enabled       = true
  }
}

aks_clusters = {
  "aks-dev-nithin" = {
    resource_group_name = "rg-dev-nithin"
    location            = "East US"
    dns_prefix          = "aksnithin"
    sku_tier            = "Free"
    oidc_issuer_enabled       = true
    workload_identity_enabled = true
    default_node_pool = {
      name                = "default"
      node_count          = 1
      vm_size             = "standard_dc2s_v3"
      enable_auto_scaling = false
    }
    network_profile = {
      network_plugin    = "azure"
      load_balancer_sku = "standard"
    }
    tags = {
      environment = "dev"
    }
  }
}
