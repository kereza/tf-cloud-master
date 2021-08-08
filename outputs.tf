data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = "main-organization"
}

output "workspace_id_all" {
  value = data.tfe_workspace_ids.all
}