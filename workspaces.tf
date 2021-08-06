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

resource "tfe_workspace" "tf_core_vpc" {
  name         = "vpc-dev"
  organization = "main-organization"
  description = "VPC for the Development stage"
  terraform_version = "0.13.5"
  working_directory = "vpc"
  vcs_repo {
      identifier = "kereza/tf-core"
      branch = "main"
      oauth_token_id = "ot-JCvw4T59EFMc8dUm"
  }
}



# Variables for workspaces
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