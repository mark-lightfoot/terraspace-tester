module_version     = "~> 12.0.0"

folder = "<%= output('folder.folders').to_ruby["ids"]["dev"] %>"

projects = ["<%= Terraspace.env %>-k8s"]

apis = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "storage.googleapis.com",
    "storage-component.googleapis.com",
    "container.googleapis.com",
    "cloudbuild.googleapis.com",
    "clouddeploy.googleapis.com",
]
