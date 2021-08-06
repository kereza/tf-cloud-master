resource "tfe_workspace" "aws-org" {
  name         = "aws-org"
  organization = "main-organization"
  description = "Configures AWS Organization and IAM users/roles"
  terraform_version = "0.13.5"
  vcs_repo {
      identifier = "kereza/aws-org"
      branch = "main"
      oauth_token_id = var.oauth_token_id
  }
}

# Variables for aws-org workspaces
resource "tfe_variable" "main_aws_access_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.MAIN_AWS_KEY 
  category     = "env"
  workspace_id = tfe_workspace.aws-org.id
  description  = "MAIN_AWS_KEY"
  sensitive = true
}

resource "tfe_variable" "main_aws_secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.MAIN_AWS_SECRET 
  category     = "env"
  workspace_id = tfe_workspace.aws-org.id
  description  = "MAIN_SECRET_KEY"
  sensitive = true
}

resource "tfe_variable" "aws_default_region" {
  key          = "AWS_DEFAULT_REGION"
  value        = "eu-central-1"
  category     = "env"
  workspace_id = tfe_workspace.aws-org.id
  description  = "AWS_DEFAULT_REGION"
  sensitive = false
}

# Loop to create the CORE AWS workspaces
resource "tfe_workspace" "core_workspaces" {
  for_each     = var.core_workspaces
  name         = each.key
  organization = "main-organization"
  description = each.value.description
  terraform_version = "0.13.5"
  working_directory = each.value.working_directory
  vcs_repo {
      identifier = each.value.repo
      branch = each.value.branch
      oauth_token_id = var.oauth_token_id
  }
}

# Default variables for the CORE AWS workspaces
resource "tfe_variable" "main_aws_access_key" {
  for_each     = var.core_workspaces
  key          = "env"
  value        = each.value.environment
  category     = "env"
  workspace_id = tfe_workspace.core_workspaces[each.key].id
  description  = "Environment"
  sensitive = false
}
