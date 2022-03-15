module "folders" {
    source  = "terraform-google-modules/folders/google"
    version = "<%= module_version_spec('folder') %>"

    parent            = var.root_folder
    names             = var.folders
    set_roles         = false
}

resource "google_folder_iam_member" "admin_view" {
    for_each = module.folders.folders_map

    folder = each.value.folder_id
    role   = "roles/viewer"
    member = "group:${var.admin_group}"
    depends_on = [
      module.folders
    ]
}

resource "google_folder_iam_member" "admin_folder_view" {
    for_each = module.folders.folders_map

    folder = each.value.folder_id
    role   = "roles/resourcemanager.folderViewer"
    member = "group:${var.admin_group}"
    depends_on = [
      module.folders
    ]
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

resource "google_storage_bucket_iam_member" "env_sa_tfstate" {
    bucket = "${var.project_factory_project}-tfstate"
    role   = "roles/storage.admin"
    member = "serviceAccount:${google_service_account.env_sa.email}"
}

resource "google_service_account_iam_member" "pf_sa_env" {
    service_account_id = google_service_account.env_sa.name
    role               = "roles/iam.serviceAccountTokenCreator"
    member             = "serviceAccount:${local.terraform_service_account}"
}

# this needs fixing as group doesnt want to work for some reason
resource "google_service_account_iam_member" "usr_env" {
    service_account_id = google_service_account.env_sa.name
    role               = "roles/iam.serviceAccountTokenCreator"
    member             = "group:${var.admin_group}"
}
