resource "google_artifact_registry_repository" "repo" {
    provider = google-beta

    project       = var.project_id
    location      = var.location
    format        = var.format
    repository_id = var.repo_id
}
