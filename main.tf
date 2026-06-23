terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
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


module "internet_gateway" {
  source = "./modules/igw"

  vpc_id = module.vpc.vpc_id
  name   = var.igw_name
}
module "public_route_table" {

  source = "./modules/public_route_table"

  vpc_id = module.vpc.vpc_id

  igw_id = module.internet_gateway.igw_id

  public_subnet_ids = [
    module.subnets.subnet_ids["public-1"],
    module.subnets.subnet_ids["public-2"]
  ]

  route_table_name = "public-route-table"
}