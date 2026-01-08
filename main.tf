# =============================================================================
# MAIN TERRAFORM CONFIGURATION
# =============================================================================

terraform {
  required_version = ">= 1.6"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# =============================================================================
# RETRIEVE DATABASE CREDENTIALS FROM AWS SECRETS MANAGER
# =============================================================================

# Get database username
data "aws_secretsmanager_secret" "db_username" {
  name = "${var.environment}-db-username"
}

data "aws_secretsmanager_secret_version" "db_username" {
  secret_id = data.aws_secretsmanager_secret.db_username.id
}

# Get database password
data "aws_secretsmanager_secret" "db_password" {
  name = "${var.environment}-db-password"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}

# =============================================================================
# VPC MODULE
# =============================================================================

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# =============================================================================
# SECURITY MODULE
# =============================================================================

module "security" {
  source = "./modules/security"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  vpc_cidr    = module.vpc.vpc_cidr
}

# =============================================================================
# DATABASE MODULE
# =============================================================================

module "database" {
  source = "./modules/database"

  environment          = var.environment
  private_subnet_ids   = module.vpc.private_subnet_ids
  database_sg_id       = module.security.database_sg_id
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_name              = var.db_name
  
  # ✅ CORRECT: Get from AWS Secrets Manager (NOT from variables)
  db_username = data.aws_secretsmanager_secret_version.db_username.secret_string
  db_password = data.aws_secretsmanager_secret_version.db_password.secret_string
  
  multi_az = var.multi_az
}

# =============================================================================
# COMPUTE MODULE
# =============================================================================

module "compute" {
  source = "./modules/compute"

  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  web_sg_id         = module.security.web_sg_id
  instance_type     = var.instance_type
  min_size          = var.min_size
  max_size          = var.max_size
  desired_capacity  = var.desired_capacity
  db_endpoint       = module.database.db_endpoint
  db_name           = module.database.db_name
}