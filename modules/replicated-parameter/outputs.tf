output "arns" {
  description = "ARNs of the parameter in both regions"
  value       = [aws_ssm_parameter.primary.arn, aws_ssm_parameter.replica.arn]
}
