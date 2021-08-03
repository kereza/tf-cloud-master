resource "tfe_workspace" "aws-org" {
  name         = "aws-org"
  organization = "main-organization"
  description = "Configures AWS Organization and IAM users/roles"
  terraform_version = "0.13.5"
  vcs_repo {
      identifier = "kereza/aws-org"
      branch = "main"
      oauth_token_id = "ot-JCvw4T59EFMc8dUm"
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

resource "tfe_variable" "wtf" {
  key          = "wtf"
  value        = var.wtf
  category     = "env"
  workspace_id = tfe_workspace.aws-org.id
  description  = "wtf desc"
  sensitive = true
}