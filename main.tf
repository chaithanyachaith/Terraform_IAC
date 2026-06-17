terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
}

module "s3" {
  source = "./modules/s3"

  bucket_name       = var.bucket_name
  project_name      = var.project_name
  environment       = var.environment
  enable_versioning = var.enable_versioning
}
module "subnets" {
  source = "./modules/subnets"

  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}