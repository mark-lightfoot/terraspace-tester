module_version       = "~> 20.0.0"
project_id           = "<%= output('project.project').to_ruby["dev-k8s"]["project_id"] %>"
region               = "<%= region %>"
name                 = "gold-cluster"
network              = "<%= Terraspace.env %>-vpc"
subnetwork           = "gke-subnet"
ip_range_pods        = "pods-secondary"
ip_range_services    = "svcs-secondary"
release_channel      = "STABLE"
master_ip_cidr       = "172.18.0.0/28"
#google_groups_domain = "gke-security-groups@cts.co" # until setup
service_account      = "<%= output('project.project').to_ruby["dev-k8s"]["service_account_email"] %>"

node_pools                = [
    {
      name               = "pool"
      machine_type       = "n1-standard-2"
      min_count          = 1
      max_count          = 1
      local_ssd_count    = 0
      disk_size_gb       = 50
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      preemptible        = false
      initial_node_count = 1
    }
]
node_pools_oauth_scopes   = {
    all = []

    pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
}

node_pools_labels = {
    all = {}

    pool = {
      default-node-pool = true
    }
}

node_pools_metadata = {
    all = {}

    pool = {
      node-pool-metadata-custom-value = "gold-path-pool"
    }
}

node_pools_taints = {
    all = []

    pool = []
}

node_pools_tags = {
    all = []

    pool = [
      "default-node-pool",
    ]
}
