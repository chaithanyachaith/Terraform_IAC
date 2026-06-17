locals {
  subnets_map = {
    for subnet in var.subnets :
    subnet.name => subnet
  }
}