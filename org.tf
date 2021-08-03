resource "tfe_organization" "keri" {
  name  = "first-org"
  email = "kereza85@gmail.com"
  session_timeout_minutes = 20160
  session_remember_minutes = 20160
  collaborator_auth_policy = "password"
  owners_team_saml_role_id  = "wtfrole"
}
