variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "nat_gateway_ids" {
  type = list(string)
}

variable "route_table_name" {
  type = string
}