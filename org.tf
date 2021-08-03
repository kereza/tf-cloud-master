resource "tfe_organization" "second" {
  name  = "second-org"
  email = "kereza85@gmail.com"
  session_timeout_minutes = 20160
  session_remember_minutes = 20160
  collaborator_auth_policy = "password"
  owners_team_saml_role_id  = "second"
}

resource "tfe_organization" "aws_org" {
  name  = "aws-org"
  email = "kereza85@gmail.com"
  session_timeout_minutes = 20160
  session_remember_minutes = 20160
  collaborator_auth_policy = "password"
  owners_team_saml_role_id  = "aws_org"
}
