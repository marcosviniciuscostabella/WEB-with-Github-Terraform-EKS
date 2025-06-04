output "cluster_id" {
  description = "ID del clúster EKS"
  value       = module.eks.cluster_id
}

output "cluster_name" {
  description = "Nombre del clúster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint del clúster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "CA data del clúster EKS"
  value       = module.eks.cluster_certificate_authority_data
}

