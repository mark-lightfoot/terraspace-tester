# This is where you put your resource declaration

module "project" {
    source  = "terraform-google-modules/project-factory/google"
    version = "<%= module_version %>"

    name              = var.project_name
    org_id            = var.org_id
    billing_account   = var.billing_account
    random_project_id = true
}
