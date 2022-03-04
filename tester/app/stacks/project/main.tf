# This is where you put your resource declaration

module "project" {
    source  = "terraform-google-modules/project-factory/google"
    version = "<%= module_version %>"

    for_each = toset(var.projects)

    name              = each.value
    org_id            = var.org_id
    folder_id         = var.folder_id
    billing_account   = var.billing_account
    random_project_id = true
}
