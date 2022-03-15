module "registry" {
    source = "../../modules/artifact-registry"

    project_id = var.project_factory_project
    location   = var.location
    format     = var.format
    repo_id    = "${var.repo_id}"
}
