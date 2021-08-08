output "workspace_id" {
  value = tfe_workspace.aws-org.id
}

data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = "main-organization"
}

output "workspace_id_all" {
  value = data.tfe_workspace.all
}