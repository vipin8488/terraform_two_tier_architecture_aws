cat > README.md << 'EOF'
# AWS Two-Tier Application Infrastructure

## **📌 Overview**
This project deploys a **production-ready two-tier application** on AWS using Terraform. It includes:
- **VPC** with public/private subnets for network isolation.
- **Application Load Balancer (ALB)** for traffic distribution.
- **Auto Scaling Group (ASG)** for high availability and scalability.
- **RDS MySQL** for managed database services.
- **AWS Secrets Manager** for secure credential storage.
- **Remote state management** with S3 and DynamoDB for locking.

- <img width="1536" height="1024" alt="ChatGPT Image Jan 8, 2026, 08_39_07 PM" src="https://github.com/user-attachments/assets/0fb8ec7f-db4b-44b3-93c2-674d11ea1a12" />


## Features
- ✅ VPC with public/private subnets
- ✅ Application Load Balancer
- ✅ Auto Scaling EC2 instances
- ✅ RDS MySQL database
- ✅ AWS Secrets Manager for credentials
- ✅ Remote state with S3 + DynamoDB locking
- ✅ Multi-environment (dev/prod)

---

## **📦 Prerequisites**
- **AWS Account** with appropriate IAM permissions.
- **AWS CLI** configured with credentials.
- **Terraform v1.6+** installed.
- **Git** for version control.

---

### **1. Clone the Repository**
```bash
git clone https://github.com/vipin8488/terraform_two_tier_architecture_aws.git
cd terraform_two_tier_architecture_aws

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



## Cost Estimate
- Dev: ~$42–$55/month
- Prod: ~$80–$150/month
EOF
