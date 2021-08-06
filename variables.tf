variable "MAIN_AWS_KEY" {}
variable "MAIN_AWS_SECRET" {}


variable "core_workspaces" {
    description = "Worskpaces and their settings"
    type = map(map(string))
    default = {
      vpc-dev = {
        working_directory = "vpc"
        branch = "main"
        repo = "kereza/tf-core"
        description = "description"
      },
      security-dev = {
        working_directory = "security"
        branch = "main"
        repo = "kereza/tf-core"
        description = "description"
      }
    }
}