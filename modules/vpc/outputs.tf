output "vpc_id" {
  description = "ID de la VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "IDs de las subnets públicas"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "IDs de las subnets privadas"
  value       = module.vpc.private_subnets
}
