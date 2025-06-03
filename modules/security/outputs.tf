output "security_group_id" {
  description = "ID del Security Group para los nodos EKS"
  value       = aws_security_group.eks_nodes_sg.id
}
