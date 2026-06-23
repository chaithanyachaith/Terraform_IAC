variable "allocation_ids" {

  description = "Elastic IP Allocation IDs"

  type = list(string)
}

variable "public_subnet_ids" {

  description = "Public Subnet IDs"

  type = list(string)
}

variable "nat_gateway_name" {

  description = "NAT Gateway Name"

  type = string
}

variable "igw_id" {

  description = "Internet Gateway ID"

  type = string
}