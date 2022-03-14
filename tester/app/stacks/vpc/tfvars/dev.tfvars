module_version = "~> 4.0.0"
project_id     = "<%= output('project.project').to_ruby["dev-k8s"]["project_id"] %>"
# Optional variables:
# routing_mode     = "GLOBAL"
subnets = [
    {
        subnet_name   = "gke-subnet"
        subnet_ip     = "10.0.0.0/16"
        subnet_region = "<%= region %>"
    }
]
secondary_ranges = {
    "gke-subnet" = [
        {
            range_name    = "pods-secondary"
            ip_cidr_range =  "10.10.0.0/16"
        },
        {
            range_name    = "svcs-secondary"
            ip_cidr_range =  "10.20.0.0/16"
        }
    ]
}
# routes           = any
