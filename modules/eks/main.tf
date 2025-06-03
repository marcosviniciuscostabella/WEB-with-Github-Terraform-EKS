# Módulo EKS (usa el módulo oficial de Terraform)

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.8"  # puedes ajustar la versión

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_groups = {
    default = {
      desired_capacity = var.node_desired_size
      max_capacity     = var.node_max_size
      min_capacity     = var.node_min_size
      instance_types   = [var.node_instance_type]
    }
  }

  # habilitamos addons (opcional, por si quieres coredns, kube-proxy, etc.)
  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflicts = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  # tags opcionales
  tags = {
    Environment = "dev"
    Project     = "web-pedidos"
  }
}
