module "folders" {
    source  = "terraform-google-modules/folders/google"
    version = "<%= module_version %>"

    parent            = var.root_folder
    names             = var.folders
    set_roles         = var.set_roles
    per_folder_admins = var.folder_admins
}

resource "google_service_account" "env_sa" {
    account_id   = "${var.env}-tf-sa"
    display_name = "Terraform SA for env"
    project      = var.project_factory_project
    depends_on = [
      module.folders
    ]
}

resource "google_folder_iam_member" "env_sa_owner" {
    for_each = module.folders.folders_map

    folder = each.value.folder_id
    role   = "roles/owner"
    member = "serviceAccount:${google_service_account.env_sa.email}"
}

resource "google_folder_iam_member" "env_sa_admin" {
    for_each = module.folders.folders_map

    folder = each.value.folder_id
    role   = "roles/resourcemanager.folderAdmin"
    member = "serviceAccount:${google_service_account.env_sa.email}"
}
