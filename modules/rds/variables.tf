variable "db_subnet_group_name" {
  description = "Name of the DB Subnet Group"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_instance_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "username" {
  description = "Database master username"
  type        = string
}

variable "password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "rds_security_group_id" {
  description = "RDS Security Group ID"
  type        = string
}