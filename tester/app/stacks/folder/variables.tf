# this exists while not used, to properly supress warnings
variable "module_version_folder" {
  type = string
}

variable "region" {
  type = string
}

variable "project_factory_project" {
  type = string
}

variable "env" {
  type = string
}

variable "root_folder" {
  type = string
}

variable "folders" {
  type = list(string)
}

variable "admin_group" {
  type = string
}
