variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "alb_sg_name" {
  description = "ALB Security Group Name"
  type        = string
}

variable "ec2_sg_name" {
  description = "EC2 Security Group Name"
  type        = string
}

variable "rds_sg_name" {
  description = "RDS Security Group Name"
  type        = string
}