# this exists while not used, to properly supress warnings
variable "module_version" {
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

variable "set_roles" {
  type    = bool
  default = false
}

variable "folder_admins" {
  type = map(string)
}
