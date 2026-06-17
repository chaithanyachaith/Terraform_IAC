variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(object({
    name   = string
    cidr   = string
    az     = string
    public = bool
  }))
}