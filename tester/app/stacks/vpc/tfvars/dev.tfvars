module_version     = "~> 4.0.0"

# Optional variables:
# routing_mode     = "GLOBAL"
subnets = [
    {
        subnet_name   = "gke-subnet"
        subnet_ip     = "10.10.10.0/16"
        subnet_region = "<%= region %>"
    }
]
secondary_ranges = {
    "gke-subnet" = [
        {
            range_name    = "pods-secondary"
            ip_cidr_range =  "10.0.10.0/16"
        },
        {
            range_name    = "svcs-secondary"
            ip_cidr_range =  "10.0.11.0/16"
        }
    ]
}
# routes           = any
