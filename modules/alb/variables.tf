variable "alb_name" {

  description = "Application Load Balancer Name"

  type = string
}

variable "public_subnet_ids" {

  description = "Public Subnet IDs"

  type = list(string)
}

variable "alb_security_group_id" {

  description = "ALB Security Group ID"

  type = string
}