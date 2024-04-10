variable "name" {
  description = "The name of the cluster, unique within the project and location."
  type        = string
  default     = "sh-gke-cluster"
}

variable "location" {
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location."
  type        = string
  default     = "us-central1-a"
}

variable "node_locations" {
  description = "The list of zones in which the cluster's nodes are located."
  type        = list(string)
  default     = ["us-central1-a", "us-central1-b"]
}

variable "deletion_protection" {
  description = "Whether or not to allow Terraform to destroy the cluster."
  type        = bool
  default     = false
}


variable "allow_net_admin" {
  description = "Enable NET_ADMIN for the cluster."
  type        = bool
  default     = false
}

variable "cluster_ipv4_cidr" {
  description = "The IP address range of the Kubernetes pods in this cluster in CIDR notation."
  type        = string
  default     = "10.0.0.0/14"
}


variable "description" {
  description = "Description of the cluster."
  type        = string
  default     = "My GKE Cluster"
}

variable "default_max_pods_per_node" {
  description = "The default maximum number of pods per node in this cluster."
  type        = number
  default     = 110
}

variable "enable_kubernetes_alpha" {
  description = "Whether to enable Kubernetes Alpha features for this cluster."
  type        = bool
  default     = false
}

variable "enable_tpu" {
  description = "Whether to enable Cloud TPU resources in this cluster."
  type        = bool
  default     = false
}

variable "enable_legacy_abac" {
  description = "Whether the ABAC authorizer is enabled for this cluster."
  type        = bool
  default     = false
}

variable "enable_shielded_nodes" {
  description = "Enable Shielded Nodes features on all nodes in this cluster."
  type        = bool
  default     = true
}

variable "enable_autopilot" {
  description = "Enable Autopilot for this cluster."
  type        = bool
  default     = false
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster's default node pool."
  type        = number
  default     = 1
}


variable "networking_mode" {
  description = "Determines whether alias IPs or routes will be used for pod IPs in the cluster."
  type        = string
  default     = "VPC_NATIVE"
}

variable "logging_service" {
  description = "The logging service that the cluster should write logs to."
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}


variable "min_master_version" {
  description = "The minimum version of the master."
  type        = string
  default     = "1.29"
}

variable "monitoring_service" {
  description = "The monitoring service that the cluster should write metrics to."
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "network" {
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
  type        = string
  default     = "default"
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
  default     = "tiny-pool"
}

# variable "project" {
#   description = "The ID of the project in which the resource belongs."
#   type        = string
# }


variable "remove_default_node_pool" {
  description = "If true, deletes the default node pool upon cluster creation."
  type        = bool
  default     = true
}

variable "resource_labels" {
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster."
  type        = map(string)
  default     = {}
}

variable "subnetwork" {
  description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
  type        = string
  default     = "default"
}

variable "enable_intranode_visibility" {
  description = "Whether Intra-node visibility is enabled for this cluster."
  type        = bool
  default     = false
}

variable "enable_l4_ilb_subsetting" {
  description = "Whether L4ILB Subsetting is enabled for this cluster."
  type        = bool
  default     = false
}

variable "enable_multi_networking" {
  description = "Whether multi-networking is enabled for this cluster."
  type        = bool
  default     = false
}

variable "enable_fqdn_network_policy" {
  description = "Whether FQDN Network Policy is enabled on this cluster."
  type        = bool
  default     = false
}

variable "private_ipv6_google_access" {
  description = "The desired state of IPv6 connectivity to Google Services."
  type        = string
  default     = "DISABLED"
}

variable "datapath_provider" {
  description = "The desired datapath provider for this cluster."
  type        = string
  default     = "LEGACY_DATAPATH"
}

variable "enable_cilium_clusterwide_network_policy" {
  description = "Whether CiliumClusterWideNetworkPolicy is enabled on this cluster."
  type        = bool
  default     = false
}

variable "default_snat_status" {
  description = "Controls whether default in-node sNAT should be disabled on the cluster."
  type = object({
    disabled = bool
  })
  default = {
    disabled = false
  }
}

variable "enable_k8s_beta_apis" {
  description = "Enabled Kubernetes Beta APIs."
  type        = list(string)
  default     = []
}

variable "cloudrun_config" {
  description = "Configuration for the CloudRun addon."
  type = object({
    disabled           = bool
    load_balancer_type = string
  })
  default = {
    disabled           = false
    load_balancer_type = "EXTERNAL"
  }
}

variable "identity_service_config" {
  description = "Configuration for the Identity Service component."
  type = object({
    enabled = bool
  })
  default = {
    enabled = false
  }
}

variable "istio_config" {
  description = "Configuration for the Istio addon."
  type = object({
    disabled = bool
    auth     = string
  })
  default = {
    disabled = false
    auth     = ""
  }
}

# variable "cluster_autoscaling" {
#   description = "Configuration for node auto-provisioning."
#   type = object({
#     enabled = bool
#     resource_limits = list(object({
#       resource_type = string
#       minimum       = number
#       maximum       = number
#     }))
#     auto_provisioning_defaults = object({
#       min_cpu_platform  = string
#       oauth_scopes      = list(string)
#       service_account   = string
#       boot_disk_kms_key = string
#       disk_size         = number
#       disk_type         = string
#       image_type        = string
#       shielded_instance_config = object({
#         enable_secure_boot          = bool
#         enable_integrity_monitoring = bool
#       })
#       management = object({
#         auto_upgrade = bool
#         auto_repair  = bool
#         upgrade_settings = object({
#           strategy        = string
#           max_surge       = number
#           max_unavailable = number
#           blue_green_settings = object({
#             node_pool_soak_duration = string
#             standard_rollout_policy = object({
#               batch_percentage    = number
#               batch_node_count    = number
#               batch_soak_duration = string
#             })
#           })
#         })
#       })
#     })
#     autoscaling_profile = optional(string)
#   })
#   # default = {
#   #   enabled = false
#   #   # autoscaling_profile = 
#   #   auto_provisioning_defaults = {
#   #     min_cpu_platform = ""
#   #     oauth_scopes     = []
#   #   }
#   # }
# }
#
# variable "with_optional_attribute" {
#   type = object({
#     a = string                # a required attribute
#     b = optional(string)      # an optional attribute
#     c = optional(number, 127) # an optional attribute with default value
#   })
# }
#
#
# variable "logging_config" {
#   description = "Configuration for logging."
#   type = object({
#     enable_components = list(string)
#   })
#   default = {
#     enable_components = []
#   }
# }
#
# variable "monitoring_config" {
#   description = "Configuration for monitoring."
#   type = object({
#     enable_components = list(string)
#     managed_prometheus = object({
#       enabled = bool
#     })
#     advanced_datapath_observability_config = object({
#       enable_metrics = bool
#       enable_relay   = bool
#       relay_mode     = string
#     })
#   })
#   default = {
#     enable_components = []
#     managed_prometheus = {
#       enabled = false
#     }
#     advanced_datapath_observability_config = {
#       enable_metrics = false
#       enable_relay   = false
#       relay_mode     = ""
#     }
#   }
# }
#
# variable "maintenance_policy" {
#   description = "Maintenance policy configuration."
#   type = object({
#     daily_maintenance_window = object({
#       start_time = string
#     })
#     recurring_window = object({
#       start_time = string
#       end_time   = string
#       recurrence = string
#     })
#     maintenance_exclusion = list(object({
#       exclusion_name = string
#       start_time     = string
#       end_time       = string
#       exclusion_options = object({
#         scope = string
#       })
#     }))
#   })
#   default = {
#     daily_maintenance_window = {
#       start_time = ""
#     }
#     recurring_window = {
#       start_time = ""
#       end_time   = ""
#       recurrence = ""
#     }
#     maintenance_exclusion = [
#       {
#         exclusion_name = ""
#         start_time     = ""
#         end_time       = ""
#         exclusion_options = {
#           scope = ""
#         }
#       }
#     ]
#   }
# }
#
# variable "ip_allocation_policy" {
#   description = "IP allocation policy configuration."
#   type = object({
#     cluster_secondary_range_name  = string
#     services_secondary_range_name = string
#     cluster_ipv4_cidr_block       = string
#     services_ipv4_cidr_block      = string
#     stack_type                    = string
#     additional_pod_ranges_config = object({
#       pod_range_names = list(string)
#     })
#   })
#   default = {
#     cluster_secondary_range_name  = ""
#     services_secondary_range_name = ""
#     cluster_ipv4_cidr_block       = ""
#     services_ipv4_cidr_block      = ""
#     stack_type                    = "IPV4"
#     additional_pod_ranges_config = {
#       pod_range_names = []
#     }
#   }
# }
#
# variable "master_auth" {
#   description = "Master authentication configuration."
#   type = object({
#     client_certificate_config = object({
#       issue_client_certificate = bool
#     })
#   })
#   default = {
#     client_certificate_config = {
#       issue_client_certificate = false
#     }
#   }
# }
#
# variable "master_authorized_networks_config" {
#   description = "Master authorized networks configuration."
#   type = object({
#     cidr_blocks = list(object({
#       cidr_block   = string
#       display_name = string
#     }))
#     gcp_public_cidrs_access_enabled = bool
#   })
#   default = {
#     cidr_blocks                     = []
#     gcp_public_cidrs_access_enabled = false
#   }
# }
#
#
# variable "network_policy" {
#   description = "Network policy configuration."
#   type = object({
#     provider = string
#     enabled  = bool
#   })
#   default = {
#     provider = "PROVIDER_UNSPECIFIED"
#     enabled  = true
#   }
# }
#
# # variable "node_config" {
# #   description = "Node configuration."
# #   type = object({
# #     disk_size_gb                = number
# #     disk_type                   = string
# #     enable_confidential_storage = bool
# #     ephemeral_storage_config = object({
# #       local_ssd_count = number
# #     })
# #     ephemeral_storage_local_ssd_config = object({
# #       local_ssd_count = number
# #     })
# #     fast_socket = object({
# #       enabled = bool
# #     })
# #     local_nvme_ssd_block_config = object({
# #       local_ssd_count = number
# #     })
# #     gcfs_config = object({
# #       enabled = bool
# #     })
# #     gvnic = object({
# #       enabled = bool
# #     })
# #     guest_accelerator = list(object({
# #       type  = string
# #       count = number
# #       gpu_driver_installation_config = object({
# #         gpu_driver_version = string
# #       })
# #       gpu_sharing_config = object({
# #         gpu_sharing_strategy       = string
# #         max_shared_clients_per_gpu = number
# #       })
# #     }))
# #     image_type               = string
# #     labels                   = map(string)
# #     resource_labels          = map(string)
# #     local_ssd_count          = number
# #     machine_type             = string
# #     metadata                 = map(string)
# #     min_cpu_platform         = string
# #     oauth_scopes             = list(string)
# #     preemptible              = bool
# #     reservation_affinity     = var.reservation_affinity
# #     spot                     = bool
# #     sandbox_config           = var.sandbox_config
# #     boot_disk_kms_key        = string
# #     service_account          = string
# #     shielded_instance_config = object({}) // Structure not provided
# #     tags                     = list(string)
# #     resource_manager_tags    = map(string)
# #     taint = list(object({
# #       key      = string
# #       operator = string
# #       values   = list(string)
# #     }))
# #     workload_metadata_config = object({}) // Structure not provided
# #     kubelet_config           = object({}) // Structure not provided
# #     linux_node_config        = object({}) // Structure not provided
# #     node_group               = string
# #     sole_tenant_config       = object({}) // Structure not provided
# #     advanced_machine_features = object({
# #       threads_per_core = number
# #       network_performance_config = object({
# #         total_egress_bandwidth_tier = string
# #       })
# #     })
# #   })
# #   default = {
# #     disk_size_gb                = 100
# #     disk_type                   = "pd-standard"
# #     enable_confidential_storage = false
# #     ephemeral_storage_config = {
# #       local_ssd_count = 0
# #     }
# #     ephemeral_storage_local_ssd_config = {
# #       local_ssd_count = 0
# #     }
# #     fast_socket = {
# #       enabled = false
# #     }
# #     local_nvme_ssd_block_config = {
# #       local_ssd_count = 0
# #     }
# #     gcfs_config = {
# #       enabled = false
# #     }
# #     gvnic = {
# #       enabled = false
# #     }
# #     guest_accelerator     = []
# #     image_type            = ""
# #     labels                = {}
# #     resource_labels       = {}
# #     local_ssd_count       = 0
# #     machine_type          = "e2-medium"
# #     metadata              = {}
# #     min_cpu_platform      = ""
# #     oauth_scopes          = []
# #     preemptible           = false
# #     reservation_affinity  = {}
# #     spot                  = false
# #     tags                  = []
# #     resource_manager_tags = {}
# #     taint                 = []
# #     node_group            = ""
# #     advanced_machine_features = {
# #       threads_per_core = 0
# #       network_performance_config = {
# #         total_egress_bandwidth_tier = ""
# #       }
# #     }
# #   }
# # }
# #
# variable "workload_identity_config" {
#   description = "Workload identity configuration."
#   type = object({
#     workload_pool = string
#   })
#   default = {
#     workload_pool = ""
#   }
# }
#
# variable "node_pool_auto_config" {
#   description = "Node pool auto configuration."
#   type = object({
#     resource_manager_tags = map(string)
#     network_tags = object({
#       tags = list(string)
#     })
#   })
#   default = {
#     resource_manager_tags = {}
#     network_tags = {
#       tags = []
#     }
#   }
# }
#
# variable "node_pool_defaults" {
#   description = "Node pool defaults."
#   type = object({
#     node_config_defaults = object({}) // Structure not provided
#   })
#   default = {
#     node_config_defaults = {}
#   }
# }
#
# variable "notification_config" {
#   description = "Notification configuration."
#   type = object({
#     pubsub = object({
#       enabled = bool
#       topic   = string
#       filter = object({
#         event_type = list(string)
#       })
#     })
#   })
#   default = {
#     pubsub = {
#       enabled = false
#       topic   = "" // Fill in the actual value
#       filter = {
#         event_type = [] // Fill in the actual value
#       }
#     }
#   }
# }
#
# variable "confidential_nodes" {
#   description = "Confidential GKE Nodes configuration."
#   type = object({
#     enabled = bool
#   })
#   default = {
#     enabled = false
#   }
# }
#
# variable "pod_security_policy_config" {
#   description = "Pod Security Policy configuration."
#   type = object({
#     enabled = bool
#   })
#   default = {
#     enabled = false
#   }
# }
#
# variable "private_cluster_config" {
#   description = "Private cluster configuration."
#   type = object({
#     enable_private_nodes        = bool
#     enable_private_endpoint     = bool
#     master_ipv4_cidr_block      = string
#     private_endpoint_subnetwork = string
#     master_global_access_config = object({
#       enabled = bool
#     })
#   })
#   default = {
#     enable_private_nodes        = false
#     enable_private_endpoint     = false
#     master_ipv4_cidr_block      = ""
#     private_endpoint_subnetwork = ""
#     master_global_access_config = {
#       enabled = false
#     }
#   }
# }
#
# variable "reservation_affinity" {
#   description = "Reservation affinity configuration."
#   type = object({
#     consume_reservation_type = string
#     key                      = string
#     values                   = list(string)
#   })
#   default = {
#     consume_reservation_type = "UNSPECIFIED"
#     key                      = ""
#     values                   = []
#   }
# }
#
# variable "sandbox_config" {
#   description = "Sandbox configuration."
#   type = object({
#     sandbox_type = string
#   })
#   default = {
#     sandbox_type = ""
#   }
# }
#
# variable "release_channel" {
#   description = "Release channel configuration."
#   type = object({
#     channel = string
#   })
#   default = {
#     channel = ""
#   }
# }
#
# variable "cost_management_config" {
#   description = "Cost management configuration."
#   type = object({
#     enabled = bool
#   })
#   default = {
#     enabled = false
#   }
# }
#
# variable "resource_usage_export_config" {
#   description = "Resource usage export configuration."
#   type = object({
#     enable_network_egress_metering       = bool
#     enable_resource_consumption_metering = bool
#     bigquery_destination = object({
#       dataset_id = string
#     })
#   })
#   default = {
#     enable_network_egress_metering       = false
#     enable_resource_consumption_metering = true
#     bigquery_destination = {
#       dataset_id = ""
#     }
#   }
# }
#
# variable "shielded_instance_config" {
#   description = "Shielded instance configuration."
#   type = object({
#     enable_secure_boot          = bool
#     enable_integrity_monitoring = bool
#   })
#   default = {
#     enable_secure_boot          = false
#     enable_integrity_monitoring = true
#   }
# }
#
# variable "taint" {
#   description = "Taint configuration."
#   type = object({
#     key    = string
#     value  = string
#     effect = string
#   })
#   default = {
#     key    = ""
#     value  = ""
#     effect = ""
#   }
# }
#
# variable "workload_metadata_config" {
#   description = "Workload metadata configuration."
#   type = object({
#     mode = string
#   })
#   default = {
#     mode = ""
#   }
# }
#
# variable "kubelet_config" {
#   description = "Kubelet configuration."
#   type = object({
#     cpu_manager_policy   = string
#     cpu_cfs_quota        = bool
#     cpu_cfs_quota_period = string
#     pod_pids_limit       = number
#   })
#   default = {
#     cpu_manager_policy   = "none"
#     cpu_cfs_quota        = false
#     cpu_cfs_quota_period = ""
#     pod_pids_limit       = 0
#   }
# }
#
# variable "linux_node_config" {
#   description = "Linux node configuration."
#   type = object({
#     sysctls     = map(string)
#     cgroup_mode = string
#   })
#   default = {
#     sysctls     = {}
#     cgroup_mode = ""
#   }
# }
#
# variable "vertical_pod_autoscaling" {
#   description = "Vertical Pod Autoscaling configuration."
#   type = object({
#     enabled = bool
#   })
#   default = {
#     enabled = false
#   }
# }
#
# variable "dns_config" {
#   description = "DNS configuration."
#   type = object({
#     cluster_dns        = string
#     cluster_dns_scope  = string
#     cluster_dns_domain = string
#   })
#   default = {
#     cluster_dns        = ""
#     cluster_dns_scope  = ""
#     cluster_dns_domain = ""
#   }
# }
#
# variable "gateway_api_config" {
#   description = "Gateway API configuration."
#   type = object({
#     channel = string
#   })
#   default = {
#     channel = ""
#   }
# }
#
# variable "protect_config" {
#   description = "Protect configuration."
#   type = object({
#     workload_config = object({
#       audit_mode = string
#     })
#     workload_vulnerability_mode = string
#   })
#   default = {
#     workload_config = {
#       audit_mode = ""
#     }
#     workload_vulnerability_mode = ""
#   }
# }
#
# variable "security_posture_config" {
#   description = "Security posture configuration."
#   type = object({
#     mode               = string
#     vulnerability_mode = string
#   })
#   default = {
#     mode               = ""
#     vulnerability_mode = ""
#   }
# }
#
# variable "fleet" {
#   description = "Fleet configuration."
#   type = object({
#     project = string
#   })
#   default = {
#     project = ""
#   }
# }
#
# variable "workload_alts_config" {
#   description = "Workload ALTS configuration."
#   type = object({
#     enable_alts = bool
#   })
#   default = {
#     enable_alts = false
#   }
# }


######## Node_pool config
# variable "node_pool_configs" {
#   description = "List of configurations for creating node pools."
#   type = list(object({
#     cluster  = string
#     location = optional(string)
#     autoscaling = optional(object({
#       min_node_count       = optional(number)
#       max_node_count       = optional(number)
#       total_min_node_count = optional(number)
#       total_max_node_count = optional(number)
#       location_policy      = optional(string)
#     }))
#     confidential_nodes = optional(object({
#       enabled = bool
#     }))
#     initial_node_count = optional(number)
#     management = optional(object({
#       auto_repair  = bool
#       auto_upgrade = bool
#     }))
#     max_pods_per_node = optional(number)
#     node_locations    = optional(list(string))
#     name              = optional(string)
#     name_prefix       = optional(string)
#     node_config = optional(object({
#       disk_size_gb                = optional(number)
#       disk_type                   = optional(string)
#       enable_confidential_storage = optional(bool)
#       ephemeral_storage_config = optional(object({
#         local_ssd_count = number
#       }))
#       ephemeral_storage_local_ssd_config = optional(object({
#         local_ssd_count = number
#       }))
#       fast_socket = optional(object({
#         enabled = bool
#       }))
#       local_nvme_ssd_block_config = optional(object({
#         local_ssd_count = number
#       }))
#       logging_variant = optional(string)
#       gcfs_config = optional(object({
#         enabled = bool
#       }))
#       gvnic = optional(object({
#         enabled = bool
#       }))
#       guest_accelerator = optional(list(object({
#         type  = string
#         count = number
#         gpu_driver_installation_config = object({
#           gpu_driver_version = string
#         })
#         gpu_sharing_config = object({
#           gpu_sharing_strategy       = string
#           max_shared_clients_per_gpu = number
#         })
#       })))
#       image_type       = optional(string)
#       labels           = optional(map(string))
#       resource_labels  = optional(map(string))
#       local_ssd_count  = optional(number)
#       machine_type     = optional(string)
#       metadata         = optional(map(string))
#       min_cpu_platform = optional(string)
#       oauth_scopes     = optional(list(string))
#       preemptible      = optional(bool)
#       reservation_affinity = optional(object({
#         // Structure not provided
#       }))
#       spot = optional(bool)
#       sandbox_config = optional(object({
#         // Structure not provided
#       }))
#       boot_disk_kms_key = optional(string)
#       service_account   = optional(string)
#       shielded_instance_config = optional(object({
#         // Structure not provided
#       }))
#       tags                  = optional(list(string))
#       resource_manager_tags = optional(map(string))
#       taint = optional(list(object({
#         key      = string
#         operator = string
#         values   = list(string)
#       })))
#       workload_metadata_config = optional(object({
#         // Structure not provided
#       }))
#       kubelet_config = optional(object({
#         cpu_manager_policy   = string
#         cpu_cfs_quota        = bool
#         cpu_cfs_quota_period = string
#         pod_pids_limit       = number
#       }))
#       linux_node_config = optional(object({
#         // Structure not provided
#       }))
#       node_group = optional(string)
#       sole_tenant_config = optional(object({
#         node_affinity = object({
#           key      = string
#           operator = string
#           values   = list(string)
#         })
#       }))
#       advanced_machine_features = optional(object({
#         threads_per_core = number
#         network_performance_config = object({
#           total_egress_bandwidth_tier = string
#         })
#       }))
#
#     })) // Define google_container_cluster schema here
#     network_config = optional(object({
#       create_pod_range     = optional(bool)
#       enable_private_nodes = optional(bool)
#       pod_ipv4_cidr_block  = optional(string)
#       pod_range            = optional(string)
#       additional_node_network_configs = optional(list(object({
#         network    = string
#         subnetwork = string
#       })))
#       additional_pod_network_configs = optional(list(object({
#         subnetwork          = string
#         secondary_pod_range = string
#         max_pods_per_node   = number
#       })))
#     }))
#     node_count = optional(number)
#     project    = optional(string)
#     upgrade_settings = optional(object({
#       max_surge       = optional(number)
#       max_unavailable = optional(number)
#       strategy        = optional(string)
#       blue_green_settings = optional(object({
#         standard_rollout_policy = optional(object({
#           batch_percentage    = optional(number)
#           batch_node_count    = optional(number)
#           batch_soak_duration = optional(string)
#         }))
#         node_pool_soak_duration = optional(string)
#       }))
#     }))
#     version = optional(string)
#     placement_policy = optional(object({
#       type         = optional(string)
#       policy_name  = optional(string)
#       tpu_topology = optional(string)
#     }))
#     queued_provisioning = optional(object({
#       enabled = bool
#     }))
#   }))
#   default = [{
#     cluster    = "sh-gke-cluster"
#     node_count = 1
#     version    = "1.27"
#     node_config = {
#       machine_type = "e2-standard-4"
#       disk_size_gb = 100
#       image_type   = "COS_CONTAINERD"
#       disk_type    = "pd-standard"
#     }
#   }]
# }

variable "cluster" {
  description = "Name of the GKE cluster."
  type        = string
  default     = "sh-gke-cluster"
}

variable "node_version" {
  description = "The Kubernetes version of the nodes."
  type        = string
  default     = "1.27"
}

variable "node_count" {
  description = "The number of nodes per instance group."
  type        = number
  default     = 1
}

variable "autoscaling_min_node_count" {
  description = "Minimum number of nodes per zone in the NodePool."
  type        = number
  default     = 0
}

variable "autoscaling_max_node_count" {
  description = "Maximum number of nodes per zone in the NodePool."
  type        = number
  default     = 0
}

variable "autoscaling_total_min_node_count" {
  description = "Total minimum number of nodes in the NodePool."
  type        = number
  default     = 1
}

variable "autoscaling_total_max_node_count" {
  description = "Total maximum number of nodes in the NodePool."
  type        = number
  default     = 2
}

variable "autoscaling_location_policy" {
  description = "Location policy specifies the algorithm used when scaling-up the node pool."
  type        = string
  default     = "ANY"
}

variable "confidential_nodes_enabled" {
  description = "Enable Confidential GKE Nodes for this cluster."
  type        = bool
  default     = false
}

# variable "initial_node_count" {
#   description = "The initial number of nodes for the pool."
#   type        = number
#   default     = 0
# }

variable "management_auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  type        = bool
  default     = false
}

variable "management_auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded."
  type        = bool
  default     = false
}

variable "max_pods_per_node" {
  description = "The maximum number of pods per node in this node pool."
  type        = number
  default     = 110
}

# variable "node_locations" {
#   description = "The list of zones in which the node pool's nodes should be located."
#   type        = list(string)
#   default     = []
# }

# variable "node_pool_name" {
#   description = "The name of the node pool."
#   type        = string
#   default     = "rafay-node-pool"
# }

# variable "node_pool_name_prefix" {
#   description = "Creates a unique name for the node pool beginning with the specified prefix."
#   type        = string
#   default     = "rafay"
# }

variable "network_config_enable_private_nodes" {
  description = "Enables or disables private nodes in the NodePool."
  type        = bool
  default     = false
}

variable "network_config_create_pod_range" {
  description = "Whether to create a new range for pod IPs in this node pool."
  type        = bool
  default     = false
}

variable "network_config_pod_ipv4_cidr_block" {
  description = "The IP address range for pod IPs in this node pool."
  type        = string
  default     = "10.104.0.0/14"
}

variable "node_config_machine_type" {
  description = "The name of a Google Compute Engine machine type."
  type        = string
  default     = "e2-standard-4"
}

variable "node_config_disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB."
  type        = number
  default     = 100
}

variable "node_config_image_type" {
  description = "The image type to use for this node."
  type        = string
  default     = "COS_CONTAINERD"
}

variable "node_config_disk_type" {
  description = "Type of the disk attached to each node."
  type        = string
  default     = "pd-standard"
}

variable "node_config_enable_ephemeral_storage" {
  description = "Enabling ephemeral storage will create a new range for pod IPs in this node pool."
  type        = bool
  default     = false
}

variable "node_config_local_ssd_count" {
  description = "The amount of local SSD disks that will be attached to each cluster node."
  type        = number
  default     = 0
}

variable "node_config_logging_variant" {
  description = "Parameter for specifying the type of logging agent used in a node pool."
  type        = string
  default     = "DEFAULT"
}

variable "node_config_gcfs_enabled" {
  description = "Enables the Google Container Filesystem (GCFS) on the node pool."
  type        = bool
  default     = false
}

variable "node_config_fast_socket_enabled" {
  description = "Enables fast socket on the node pool."
  type        = bool
  default     = false
}

variable "node_config_labels" {
  description = "The map of Kubernetes labels (key/value pairs) to be applied to each node."
  type        = map(string)
  default     = {}
}

variable "node_config_resource_labels" {
  description = "The resource labels for the node pool to use to annotate any related Google Compute Engine resources."
  type        = map(string)
  default     = {}
}

variable "node_config_metadata" {
  description = "The metadata key/value pairs assigned to instances in the pool."
  type        = map(string)
  default     = {}
}

variable "node_config_min_cpu_platform" {
  description = "The minimum CPU platform that all nodes in the pool will be created on."
  type        = string
  default     = ""
}

variable "node_config_reservation_affinity_consume_reservation_type" {
  description = "The configuration of the desired reservation which instances could take capacity from."
  type        = string
  default     = null
}

variable "node_config_reservation_affinity_key" {
  description = "The key for the reservation affinity."
  type        = string
  default     = null
}

variable "node_config_reservation_affinity_values" {
  description = "The list of possible values for the reservation affinity."
  type        = list(string)
  default     = []
}

variable "node_config_gvnic_enabled" {
  description = "Enables Google Virtual NIC (gVNIC) on the node pool."
  type        = bool
  default     = false
}

variable "node_config_enable_confidential_strorage" {
  description = "Enables Confidential VM on the node pool."
  type        = bool
  default     = false
}

variable "node_config_oauth_scopes" {
  description = "The set of Google API scopes to be made available on all of the node VMs."
  type        = list(string)
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"
  ]
}

variable "node_config_preemptible" {
  description = "A boolean that represents whether the underlying node VMs are preemptible."
  type        = bool
  default     = false
}

variable "node_config_spot" {
  description = "A boolean that represents whether the underlying node VMs are spot."
  type        = bool
  default     = false
}

variable "node_config_boot_disk_kms_key" {
  description = "The Customer Managed Encryption Key used to encrypt the boot disk attached to each node."
  type        = string
  default     = null
}

variable "node_config_service_account" {
  description = "The service account to be used by the Node VMs."
  type        = string
  default     = ""
}

variable "node_config_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(string)
  default     = []
}

variable "node_config_taint" {
  description = "A list of Kubernetes taints to apply to nodes."
  type = list(object({
    key      = string
    operator = string
    values   = list(string)
  }))
  default = []
}

variable "node_config_sole_tenant_node_affinity_key" {
  description = "The default or custom node affinity label key name."
  type        = string
  default     = ""
}

variable "node_config_sole_tenant_node_affinity_operator" {
  description = "Specifies affinity or anti-affinity."
  type        = string
  default     = ""
}

variable "node_config_sole_tenant_node_affinity_values" {
  description = "List of node affinity label values as strings."
  type        = list(string)
  default     = []
}

variable "node_config_advanced_machine_features_threads_per_core" {
  description = "Number of threads per core."
  type        = number
  default     = null
}

variable "node_config_advanced_machine_features_network_performance_config_total_egress_bandwidth_tier" {
  description = "Total egress bandwidth tier."
  type        = string
  default     = "TIER_1"
}

variable "node_config_workload_metadata_config_mode" {
  description = "The workload metadata configuration for this node."
  type        = string
  default     = null
}

variable "upgrade_settings_max_surge" {
  description = "The number of additional nodes that can be created beyond the current size of the node pool during the upgrade process."
  type        = number
  default     = 1
}

variable "upgrade_settings_max_unavailable" {
  description = "The number of nodes that can be simultaneously unavailable during the upgrade process."
  type        = number
  default     = 0
}

variable "upgrade_settings_strategy" {
  description = "The upgrade strategy to use for the node pool."
  type        = string
  default     = "SURGE"
}

