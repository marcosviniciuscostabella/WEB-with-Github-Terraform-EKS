variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "eks_cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
  default     = "web-pedidos-cluster"
}

variable "eks_version" {
  description = "Versión de Kubernetes para el clúster EKS"
  type        = string
  default     = "1.29"
}

variable "node_instance_type" {
  description = "Tipo de instancia EC2 para los nodos de EKS"
  type        = string
  default     = "t3.medium"
}

variable "node_min_size" {
  description = "Mínimo número de nodos"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Máximo número de nodos"
  type        = number
  default     = 3
}

variable "node_desired_size" {
  description = "Número deseado de nodos"
  type        = number
  default     = 2
}
