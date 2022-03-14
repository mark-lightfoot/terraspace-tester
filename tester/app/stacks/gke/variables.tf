# this exists while not used directly, to properly supress warnings
variable "module_version" {
  type = string
}

variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "name" {
  type    = string
}

variable "network" {
  type    = string
}

variable "subnetwork" {
  type    = string
}

variable "ip_range_pods" {
  type    = string
}

variable "ip_range_services" {
  type    = string
}

variable "release_channel" {
  type    = string
  default = "STABLE"
}

variable "node_pools" {
  type = list(object({
    name               = string,
    machine_type       = string,
    min_count          = number,
    max_count          = number,
    local_ssd_count    = number,
    disk_size_gb       = number,
    disk_type          = string,
    image_type         = string,
    auto_repair        = string,
    disk_type          = string,
    image_type         = string,
    auto_repair        = bool,
    auto_upgrade       = bool,
    preemptible        = bool,
    initial_node_count = number,
  }))
}

variable "node_pools_oauth_scopes" {
  type    = map(list(string))
}

variable "node_pools_metadata" {
  type    = map(map(string))
}

variable "node_pools_labels" {
  type    = map(map(string))
}

variable "node_pools_tags" {
  type    = map(list(string))
}

variable "node_pools_taints" {
  type = map(list(object({ key = string, value = string, effect = string })))
}

variable "service_account" {
  type    = string
}

variable "enable_config_connector" {
  type    = bool
  default = true
}

variable "enable_binary_auth" {
  type    = bool
  default = true
}

variable "google_groups_domain" {
  type    = string
  default = null # leave as null if dont want to use
}

variable "master_ip_cidr" {
  type    = string
}

variable "maintenance_start_time" {
  type    = string
  default = "2022-03-15T04:00:00Z"
}

variable "maintenance_end_time" {
  type    = string
  default = "2022-03-15T08:00:00Z"
}

variable "maintenance_recurrence" {
  type    = string
  default = "FREQ=WEEKLY;BYDAY=TU,WE,TH"
}
