output "alb_dns_name" {
  description = "Load Balancer DNS Name - Access your application here"
  value       = module.compute.alb_dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "database_endpoint" {
  description = "Database endpoint"
  value       = module.database.db_endpoint
  sensitive   = true
}

output "environment" {
  description = "Current environment"
  value       = var.environment
}