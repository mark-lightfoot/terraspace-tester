variable "project_id" {
  type    = string
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
