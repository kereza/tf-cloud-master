variable "MAIN_AWS_KEY" {
  description = "The main AWS key. Placed manually in the aws-org workspace. Used to configure the master account and additional users"
  type        = string
}
variable "MAIN_AWS_SECRET" {
  description = "The main AWS key. Placed manually in the aws-org workspace. Used to configure the master account and additional users"
  type        = string
}
variable "OPS_AWS_KEY" {
  description = "The AWS KEY used by the CloudOPS system roles. Used for building infrastructure. Placed manually in the aws-org, but distributed as env variable across other workspaces"
  type        = string
}
variable "OPS_AWS_SECRET" {
  description = "The AWS KEY used by the CloudOPS system roles. Used for building infrastructure. Placed manually in the aws-org, but distributed as env variable across other workspaces"
  type        = string
}

variable "oauth_token_id" {
  description = "Token for GitHUb communication"
  type        = string
  default     = "ot-JCvw4T59EFMc8dUm"
}

variable "core_workspaces" {
  description = "Worskpaces and their settings"
  type        = map(map(string))
  default = {
    tf-central-vpn = {
      working_directory = null
      branch            = "main"
      repo              = "kereza/tf-central-vpn"
      description       = "Central VPN and VPC"
      environment       = "infra"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    vpc-dev = {
      working_directory = "vpc"
      branch            = "dev"
      repo              = "kereza/tf-core"
      description       = "VPC creation"
      environment       = "dev"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    vpc-prod = {
      working_directory = "vpc"
      branch            = "prod"
      repo              = "kereza/tf-core"
      description       = "VPC creation"
      environment       = "prod"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    security-dev = {
      working_directory = "security"
      branch            = "dev"
      repo              = "kereza/tf-core"
      description       = "Security Groups"
      environment       = "dev"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    security-prod = {
      working_directory = "security"
      branch            = "prod"
      repo              = "kereza/tf-core"
      description       = "Security Groups"
      environment       = "prod"
      account_id        = "131845455848"
      region            = "eu-central-1"
    }
    eks-dev = {
      working_directory = "eks"
      branch            = "dev"
      repo              = "kereza/tf-core"
      description       = "EKS cluster"
      environment       = "dev"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    eks-prod = {
      working_directory = "eks"
      branch            = "prod"
      repo              = "kereza/tf-core"
      description       = "EKS cluster"
      environment       = "prod"
      account_id        = "131845455848"
      region            = "eu-central-1"
    },
    vpc-kerezov-test = {
      working_directory = "vpc"
      branch            = "dev"
      repo              = "kereza/tf-core"
      description       = "VPC creation"
      environment       = "kerezov-test"
      account_id        = "441150344550"
      region            = "eu-central-1"
    }
  }
}
