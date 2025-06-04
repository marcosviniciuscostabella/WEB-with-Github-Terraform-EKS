provider "aws" {
  region = "us-east-1"
}

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



variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
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

  node_desired_size  = var.node_desired_size
  node_max_size      = var.node_max_size
  node_min_size      = var.node_min_size
  node_instance_type = var.node_instance_type
}

# 🚀 MÓDULO SECURITY (CORRECTO ✅)
module "security" {
  source      = "./modules/security"
  vpc_id      = module.vpc.vpc_id
  vpc_cidr    = module.vpc.vpc_cidr_block
  cluster_name = var.cluster_name
}
