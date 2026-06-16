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