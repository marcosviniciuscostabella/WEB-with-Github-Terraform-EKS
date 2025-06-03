output "eks_cluster_name" {
  description = "Nombre del clúster EKS"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint del API server del clúster EKS"
  value       = module.eks.cluster_endpoint
}

output "ecr_repository_url" {
  description = "URL del repositorio ECR para la app"
  value       = aws_ecr_repository.web_pedidos.repository_url
}

output "web_pedidos_service_hostname" {
  description = "DNS del LoadBalancer de la app web-pedidos"
  value = kubernetes_service.web_pedidos_service.status[0].load_balancer[0].ingress[0].hostname
}
