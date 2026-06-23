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

module "elastic_ip" {

  source = "./modules/elastic_ip"

  eip_count = var.eip_count

  eip_name = var.eip_name
}

module "nat_gateway" {

  source = "./modules/nat_gateway"

  allocation_ids = module.elastic_ip.allocation_ids

  public_subnet_ids = [
    module.subnets.subnet_ids["public-1"],
    module.subnets.subnet_ids["public-2"]
  ]

  nat_gateway_name = var.nat_gateway_name

  igw_id = module.internet_gateway.igw_id
}

module "private_route_table" {

  source = "./modules/private_route_table"

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = [
    module.subnets.subnet_ids["private-1"],
    module.subnets.subnet_ids["private-2"]
  ]

  nat_gateway_ids = module.nat_gateway.nat_gateway_ids

  route_table_name = var.private_route_table_name
}