cat > README.md << 'EOF'
# AWS Two-Tier Application Infrastructure

## Overview
Production-ready two-tier application on AWS using Terraform with secure credential management.

## Features
- ✅ VPC with public/private subnets
- ✅ Application Load Balancer
- ✅ Auto Scaling EC2 instances
- ✅ RDS MySQL database
- ✅ AWS Secrets Manager for credentials
- ✅ Remote state with S3 + DynamoDB locking
- ✅ Multi-environment (dev/prod)

## Prerequisites
- AWS Account
- AWS CLI configured
- Terraform v1.6+

## Quick Start

1. Setup backend:
```bash
   ./scripts/1-setup-backend.sh
```

2. Create secrets:
```bash
   ./scripts/2-create-secrets.sh
```

3. Deploy:
```bash
   terraform init
   terraform workspace new dev
   terraform apply -var-file="env/dev.tfvars"
```

## Security
- Database passwords stored in AWS Secrets Manager
- No credentials in Git repository
- Network isolation (private subnets)
- Security groups with least privilege

## Architecture
[Include your architecture diagram here]

## Cost Estimate
- Dev: ~$90-105/month
- Prod: ~$200-320/month
EOF