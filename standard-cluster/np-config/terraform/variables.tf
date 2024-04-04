variable "node_pool_configs" {
  type = list(object({
    name            = string
    machine_type    = string
    oauth_scopes    = list(string)
  }))
  default = [
    {
      name            = "np1"
      machine_type    = "n1-standard-1"
      oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    },
    {
      name            = "np2"
      machine_type    = "e2-medium"
      oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    },
    {
      name            = "np3"
      machine_type    = "e2-small"
      oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    },
  ]
}
