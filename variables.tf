variable "MAIN_AWS_KEY" {
    description = "The main AWS key. Placed manually in the aws-org workspace. Used to configure the master account and additional users"
    type = string
}
variable "MAIN_AWS_SECRET" {
    description = "The main AWS key. Placed manually in the aws-org workspace. Used to configure the master account and additional users"
    type = string
}
variable "OPS_AWS_KEY" {
    description = "The AWS KEY used by the CloudOPS system roles. Used for building infrastructure. Placed manually in the aws-org, but distributed as env variable across other workspaces"
    type = string
}
variable "OPS_AWS_SECRET" {
    description = "The AWS KEY used by the CloudOPS system roles. Used for building infrastructure. Placed manually in the aws-org, but distributed as env variable across other workspaces"
    type = string
}

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