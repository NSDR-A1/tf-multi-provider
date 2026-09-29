terraform {
  required_version = ">= 1.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Default provider: used by anything that doesn't say otherwise
provider "aws" {
  region = "us-east-2"
}

# Second provider, with an alias
provider "aws" {
  alias  = "west"
  region = "us-west-1"
}

data "aws_region" "east" {}

data "aws_region" "west" {
  provider = aws.west
}

resource "aws_ssm_parameter" "east" {
  name  = "/multi-provider-demo/east"
  type  = "String"
  value = "Hello from ${data.aws_region.east.region}"
}

resource "aws_ssm_parameter" "west" {
  provider = aws.west
  name     = "/multi-provider-demo/west"
  type     = "String"
  value    = "Hello from ${data.aws_region.west.region}"
}

module "replicated" {
  source = "./modules/replicated-parameter"

  providers = {
    aws.primary = aws
    aws.replica = aws.west
  }

  name  = "/multi-provider-demo/replicated"
  value = "Same value, two regions"
}
