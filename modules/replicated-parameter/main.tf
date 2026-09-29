terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 6.0"
      configuration_aliases = [aws.primary, aws.replica]
    }
  }
}

resource "aws_ssm_parameter" "primary" {
  provider = aws.primary
  name     = var.name
  type     = "String"
  value    = var.value
}

resource "aws_ssm_parameter" "replica" {
  provider = aws.replica
  name     = var.name
  type     = "String"
  value    = var.value
}
