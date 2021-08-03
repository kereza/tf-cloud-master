resource "tfe_workspace" "second" {
  name         = "second-workspace"
  organization = tfe_organization.second.id
  description = "description second-workspace"
  terraform_version = "0.13.5"
  //vcs_repo
}

resource "tfe_workspace" "aws-org" {
  name         = "aws-org"
  organization = tfe_organization.aws_org.id
  description = "Configures AWS Organization and IAM users/roles"
  terraform_version = "0.13.5"
  //vcs_repo
}