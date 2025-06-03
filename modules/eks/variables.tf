variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versión de Kubernetes"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subnets públicas o privadas"
  type        = list(string)
}

variable "node_instance_type" {
  description = "Tipo de instancia para los nodos del clúster"
  type        = string
}

variable "node_min_size" {
  description = "Número mínimo de nodos en el node group"
  type        = number
}

variable "node_max_size" {
  description = "Número máximo de nodos en el node group"
  type        = number
}

variable "node_desired_size" {
  description = "Número deseado de nodos en el node group"
  type        = number
}
