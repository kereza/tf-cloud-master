variable "MAIN_AWS_KEY" {}
variable "MAIN_AWS_SECRET" {}

variable "oauth_token_id" {
    description = "Token for GitHUb communication"
    type = string
    default = "ot-JCvw4T59EFMc8dUm"
}

variable "core_workspaces" {
    description = "Worskpaces and their settings"
    type = map(map(string))
    default = {
      vpc-dev = {
        working_directory = "vpc"
        branch = "main"
        repo = "kereza/tf-core"
        description = "description"
        environment = "dev"
      },
      security-dev = {
        working_directory = "security"
        branch = "main"
        repo = "kereza/tf-core"
        description = "description"
        environment = "dev"
      }
    }
}