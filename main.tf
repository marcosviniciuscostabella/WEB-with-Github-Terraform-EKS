# main.tf

provider "aws" {
  region = "eu-west-1"  # Cambia si quieres otra región
}

# VPC
module "vpc" {
  source = "./modules/vpc/main.tf"
  # Tus variables aquí
}

# Security Group para EKS
module "security" {
  source = "./modules/security/main.tf"
  # Tus variables aquí
}

# EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "web-pedidos-cluster"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }
}

# EKS Auth
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

# Kubernetes provider
provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Deployment de la web
resource "kubernetes_deployment" "web_pedidos" {
  metadata {
    name = "web-pedidos"
    labels = {
      app = "web-pedidos"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "web-pedidos"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-pedidos"
        }
      }

      spec {
        container {
          name  = "web-pedidos"
          image = "<TU-REPO-ECR>/web-pedidos:latest"
          ports {
            container_port = 80
          }
        }
      }
    }
  }
}

# Service de la web
resource "kubernetes_service" "web_pedidos_service" {
  metadata {
    name = "web-pedidos-service"
  }

  spec {
    selector = {
      app = "web-pedidos"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
