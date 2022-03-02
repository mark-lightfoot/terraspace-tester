resource "google_storage_bucket" "this" {
  project                     = var.project_id
  name                        = var.name
  uniform_bucket_level_access = var.uniform_bucket_level_access
  location                    = var.location
}
