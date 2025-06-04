variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}
