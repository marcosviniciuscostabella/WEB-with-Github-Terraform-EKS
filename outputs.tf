output "eks_cluster_name" {
  description = "Nombre del clúster EKS"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint del API server del clúster EKS"
  value       = module.eks.cluster_endpoint
}

