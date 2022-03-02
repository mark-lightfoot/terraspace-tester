resource "random_pet" "this" {
  length = 2
}

module "bucket" {
  source = "../../modules/example"

  project_id                  = var.project_id
  name                        = "bucket-${random_pet.this.id}"
  uniform_bucket_level_access = var.uniform_bucket_level_access
  location                    = var.location
}
