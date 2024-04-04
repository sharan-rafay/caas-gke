# variable "gke_username" {
#   type        = string
#   default     = ""
#   description = "gke username"
# }
#
# variable "gke_password" {
#   type        = string
#   default     = ""
#   description = "gke password"
# }

variable "region" {
  type        = string
  default     = "us-central1-a"
  description = "name of region"
}

variable "project_id" {
  type        = string
  default     = "dev-382813"
  description = "GCP project"
}

variable "cluster_name" {
  type        = string
  default     = "caas-standard"
  description = "GCP project"
}

variable "min_master_version" {
  type        = string
  default     = "1.27"
  description = "Initial master k8s version"
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  deletion_protection = false
  release_channel {
    channel = "UNSPECIFIED"
  }

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

# resource "google_container_node_pool" "np" {
#   for_each = { for config in var.node_pool_configs : config.name => config }
#
#   name    = each.value.name
#   cluster = google_container_cluster.primary.id
#
#   node_config {
#     machine_type = each.value.machine_type
#     # service_account = each.value.service_account
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
#
#   timeouts {
#     create = "30m"
#     update = "20m"
#   }
# }

module "node_pools" {
  source            = "./node_pool" # Path to your module directory
  node_pool_configs = var.node_pool_configs
  cluster_id        = google_container_cluster.primary.id
}

# # Kubernetes provider
# # The Terraform Kubernetes Provider configuration below is used as a learning reference only. 
# # It references the variables and resources provisioned in this file. 
# # We recommend you put this in another file -- so you can have a more modular configuration.
# # https://learn.hashicorp.com/terraform/kubernetes/provision-gke-cluster#optional-configure-terraform-kubernetes-provider
# # To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider.

# provider "kubernetes" {
#   load_config_file = "false"

#   host     = google_container_cluster.primary.endpoint
#   username = var.gke_username
#   password = var.gke_password

#   client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
#   client_key             = google_container_cluster.primary.master_auth.0.client_key
#   cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
# }
