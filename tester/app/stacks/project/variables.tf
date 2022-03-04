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

variable "folder_id" {
  type    = string
}

variable "billing_account" {
  type    = string
}
