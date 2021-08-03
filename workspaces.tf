resource "tfe_workspace" "second" {
  name         = "second-workspace"
  organization = tfe_organization.second.id
  description = "description second-workspace"
  terraform_version = 13.5
  //vcs_repo
}