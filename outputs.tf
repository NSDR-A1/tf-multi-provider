output "east_region" {
  value = data.aws_region.east.region
}

output "west_region" {
  value = data.aws_region.west.region
}

output "replicated_arns" {
  value = module.replicated.arns
}
