module_version     = "~> 3.1.0"

folders       = ["<%= Terraspace.env %>"]
set_roles     = true
folder_admins = {
    "<%= Terraspace.env %>": "group:gcp-platform@cts.co"
}
