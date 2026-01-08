terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-first-twotierapp"
    key            = "two-tier-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}