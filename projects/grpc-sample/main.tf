# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=1.9.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.64.0"
    }
  }
  backend "s3" {
    region  = "ap-northeast-1"
    bucket  = "terraform-backend-20240902"
    key     = "data/grpc-sample"
    profile = "terraform"
    encrypt = true
  }
}

# ---------------------------------------------
# Provider
# ---------------------------------------------
provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

# ---------------------------------------------
# Locals
# ---------------------------------------------
locals {
  project = "grpc-sample"
}

# ---------------------------------------------
# Variables
# ---------------------------------------------
variable "instance_type" {
  type    = string
  default = "t2.micro"
}