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
  vcs_repo {
      identifier = "kereza/aws-org"
      branch = "main"
      oauth_token_id = "ot-QaQ2QKvnV9Y2nf2U"
  }
}



# Variables for workspaces
resource "tfe_variable" "test" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "env"
  workspace_id = tfe_workspace.aws-org.id
  description  = "a useful description"
}