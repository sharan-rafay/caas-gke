variable "node_pool_configs" {
  type = list(object({
    name         = string
    machine_type = string
  }))
}

variable "cluster_id" {
  type = string
}

resource "google_container_node_pool" "np" {
  for_each = { for config in var.node_pool_configs : config.name => config }

  name    = each.value.name
  cluster = var.cluster_id

  node_count = 1

  node_config {
    machine_type = each.value.machine_type
    #   oauth_scopes    = each.value.oauth_scopes
  }

  timeouts {
    create = "30m"
    update = "20m"
  }
}

