variable "region" {
  type = string
}

variable "env" {
  type = string
}

variable "project_factory_project" {
  type = string
}

variable "location" {
  type    = string
  default = "europe"
}

variable "format" {
  type    = string
  default = "DOCKER"
}

variable "repo_id" {
  type    = string
  default = "artifact-registry"
}
