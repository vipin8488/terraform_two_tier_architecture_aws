# Development Environment Configuration
environment          = "dev"
aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

# Compute Configuration (Smaller for dev)
instance_type    = "t2.micro"
min_size         = 1
max_size         = 2
desired_capacity = 1

# Database Configuration (Smaller for dev)
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "devdb"
multi_az             = false