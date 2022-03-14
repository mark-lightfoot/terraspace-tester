module "gke" {
    source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"
    version = "<%= module_version %>"

    project_id                        = var.project_id
    name                              = var.name
    region                            = var.region
    network                           = var.network
    subnetwork                        = var.subnetwork
    ip_range_pods                     = var.ip_range_pods
    ip_range_services                 = var.ip_range_services
    release_channel                   = var.release_channel
    http_load_balancing               = true
    horizontal_pod_autoscaling        = true
    network_policy                    = false
    master_ipv4_cidr_block            = var.master_ip_cidr
    identity_namespace                = "enabled"
    master_global_access_enabled      = false
    remove_default_node_pool          = true
    enable_private_endpoint           = false
    enable_private_nodes              = true
    enable_binary_authorization       = var.enable_binary_auth
    config_connector                  = var.enable_config_connector
    authenticator_security_group      = var.google_groups_domain
    node_pools                        = var.node_pools
    node_pools_oauth_scopes           = var.node_pools_oauth_scopes
    node_pools_labels                 = var.node_pools_labels
    node_pools_metadata               = var.node_pools_metadata
    node_pools_tags                   = var.node_pools_tags
    node_pools_taints                 = var.node_pools_taints
    create_service_account            = false
    service_account                   = var.service_account
    add_master_webhook_firewall_rules = true
    maintenance_start_time            = var.maintenance_start_time
    maintenance_end_time              = var.maintenance_end_time
    maintenance_recurrence            = var.maintenance_recurrence
}
