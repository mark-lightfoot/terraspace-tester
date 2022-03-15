# this exists while not used, to properly supress warnings
variable "module_version" {
  type = string
}

variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "projects" {
  type = list(string)
}

variable "org_id" {
  type    = string
}

variable "folder" {
  type    = string
}

variable "billing_account" {
  type    = string
}

variable "apis" {
  type    = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "storage.googleapis.com",
    "storage-component.googleapis.com",
    "container.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddeploy.googleapis.com",
  ]
}
