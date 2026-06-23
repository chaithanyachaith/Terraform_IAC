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

module "security_groups" {

  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id

  alb_sg_name = var.alb_sg_name

  ec2_sg_name = var.ec2_sg_name

  rds_sg_name = var.rds_sg_name
}

module "alb" {

  source = "./modules/alb"

  alb_name = var.alb_name

  public_subnet_ids = [
    module.subnets.subnet_ids["public-1"],
    module.subnets.subnet_ids["public-2"]
  ]

  alb_security_group_id = module.security_groups.alb_security_group_id
}
module "target_group" {

  source = "./modules/target_group"

  vpc_id = module.vpc.vpc_id

  target_group_name = var.target_group_name
}

module "listener" {

  source = "./modules/listener"

  alb_arn = module.alb.alb_arn

  target_group_arn = module.target_group.target_group_arn
}

module "launch_template" {

  source = "./modules/launch_template"

  launch_template_name = var.launch_template_name

  ami_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  ec2_security_group_id = module.security_groups.ec2_security_group_id

  user_data_file = var.user_data_file
}

module "auto_scaling" {

  source = "./modules/auto_scaling"

  asg_name = var.asg_name

  launch_template_id = module.launch_template.launch_template_id

  private_subnet_ids = [
    module.subnets.subnet_ids["private-1"],
    module.subnets.subnet_ids["private-2"]
  ]

  target_group_arn = module.target_group.target_group_arn

  min_size = var.min_size

  max_size = var.max_size

  desired_capacity = var.desired_capacity
}