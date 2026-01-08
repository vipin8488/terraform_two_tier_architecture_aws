# Production Environment Configuration
environment          = "prod"
aws_region           = "us-east-1"
vpc_cidr             = "10.1.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24"]

# Compute Configuration (Larger for prod)
instance_type    = "t3.micro"
min_size         = 2
max_size         = 6
desired_capacity = 2

# Database Configuration (Larger for prod with Multi-AZ)
db_instance_class    = "db.t3.micro"
db_allocated_storage = 100
db_name              = "proddb"
multi_az             = true