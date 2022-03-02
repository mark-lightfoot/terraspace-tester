variable "env" {
  type = string
}

variable "project_id" {
  type = string
}

variable "routing_mode" {
  type    = string
  default = "GLOBAL"
}

variable "subnets" {
  type = list(object({
      subnet_name           = string
      subnet_ip             = string
      subnet_region         = string
      subnet_private_access = optional(bool)
      description           = optional(string)
  }))
  default = []
}

variable "secondary_ranges" {
  type = map(list(object({
    range_name    = string
    ip_cidr_range = string
  })))
  default = {}
}

variable "routes" {
  type = list(object({
    name                   = string
    description            = string
    destination_range      = string
    tags                   = string
    next_hop_internet      = optional(bool)
    next_hop_instance      = optional(string)
    next_hop_instance_zone = optional(string)
  }))
  default = []
}
