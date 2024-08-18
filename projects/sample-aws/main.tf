# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
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
# Variables
# ---------------------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

# ---------------------------------------------
# Resources
# ---------------------------------------------
resource "aws_instance" "sample-by-terraform" {
  ami           = "ami-0091f05e4b8ee6709"
  instance_type = "t2.micro"
  tags = {
    "Name" = "hello"
  }
}