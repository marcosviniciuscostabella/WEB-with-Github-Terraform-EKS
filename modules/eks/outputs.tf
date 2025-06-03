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

output "node_group_role_arn" {
  description = "IAM Role ARN de los worker nodes"
  value       = module.eks.node_groups["default"].iam_role_arn
}
