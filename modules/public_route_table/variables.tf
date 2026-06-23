variable "vpc_id" {
  description = "VPC ID where the route table will be created"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "route_table_name" {
  description = "Public Route Table Name"
  type        = string
}