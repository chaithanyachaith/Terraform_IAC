variable "vpc_cidr" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}
variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
}

variable "enable_versioning" {
  description = "Enable bucket versioning"
  type        = bool
  default     = true
}

variable "subnets" {
  description = "Subnet configuration"

  type = list(object({
    name   = string
    cidr   = string
    az     = string
    public = bool
  }))
}
variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
}
variable "public_route_table_name" {
  description = "Name of the Public Route Table"
  type        = string
}

variable "eip_count" {
  description = "Number of Elastic IPs"
  type        = number
}

variable "eip_name" {
  description = "Elastic IP Name"
  type        = string
}

variable "nat_gateway_name" {

  description = "NAT Gateway Name"

  type = string
}

variable "private_route_table_name" {
  type = string
}

variable "alb_sg_name" {
  type = string
}

variable "ec2_sg_name" {
  type = string
}

variable "rds_sg_name" {
  type = string
}

variable "alb_name" {

  description = "Application Load Balancer Name"

  type = string
}

variable "target_group_name" {
  type = string
}

variable "launch_template_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "user_data_file" {
  type = string
}

variable "asg_name" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}