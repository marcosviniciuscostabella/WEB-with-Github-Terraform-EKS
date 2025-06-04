terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "TU-NOMBRE-DE-BUCKET-S3"  # 🚩 Cambia por tu bucket real
    key            = "terraform/state/eks.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# 🚀 MÓDULO VPC (OFICIAL ✅)
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

# 🚀 MÓDULO EKS (CORRECTO ✅)
module "eks" {
  source = "./modules/eks"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  eks_managed_node_groups = {
    default = {
      desired_capacity = var.node_desired_size
      max_capacity     = var.node_max_size
      min_capacity     = var.node_min_size
      instance_types   = [var.node_instance_type]
    }
  }

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

  tags = {
    Environment = "dev"
    Project     = "web-pedidos"
  }
}

# 🚀 MÓDULO SECURITY (CORRECTO ✅)
module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}
