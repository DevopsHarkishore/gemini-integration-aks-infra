variable "resource_groups" {
  description = "Map of resource groups"
  type = map(object({
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "acrs" {
  description = "Map of ACRs"
  type = map(object({
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    admin_enabled       = optional(bool, false)
    georeplications = optional(list(object({
      location                = string
      zone_redundancy_enabled = optional(bool)
      tags                    = optional(map(string))
    })), [])
    tags = optional(map(string), {})
  }))
}

variable "aks_clusters" {
  description = "Map of AKS clusters"
  type = map(object({
    resource_group_name       = string
    location                  = string
    dns_prefix                = string
    kubernetes_version        = optional(string)
    sku_tier                  = optional(string, "Free")
    oidc_issuer_enabled       = optional(bool, false)
    workload_identity_enabled = optional(bool, false)

    default_node_pool = object({

      name                = string
      node_count          = number
      vm_size             = string
      enable_auto_scaling = optional(bool, false)
      min_count           = optional(number)
      max_count           = optional(number)
      type                = optional(string, "VirtualMachineScaleSets")
      vnet_subnet_id      = optional(string)
    })

    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }), { type = "SystemAssigned" })

    network_profile = optional(object({
      network_plugin     = string
      network_policy     = optional(string)
      dns_service_ip     = optional(string)
      docker_bridge_cidr = optional(string)
      service_cidr       = optional(string)
      load_balancer_sku  = optional(string, "standard")
    }))

    tags = optional(map(string), {})
  }))
}
