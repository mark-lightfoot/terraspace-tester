# This is where you put your resource declaration

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "<%= module_version_spec('network') %>"

    project_id   = var.project_id
    network_name = "${var.env}-vpc"
    routing_mode = var.routing_mode

    subnets          = var.subnets
    secondary_ranges = var.secondary_ranges
    routes           = var.routes
}

module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "<%= module_version_spec('router') %>"
  project = var.project_id
  name    = "nat"
  network = "${var.env}-vpc"
  region  = var.region

  nats = [{
    name = "nat"
  }]

  depends_on = [
    module.vpc
  ]
}
