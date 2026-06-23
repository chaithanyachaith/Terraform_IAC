output "bucket_name" {
  value = module.s3.bucket_name
}
output "bucket_arn" {
  value = module.s3.bucket_arn
}
# VPC Outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_ids" {
  value = module.subnets.subnet_ids
}
output "igw_id" {
  value = module.internet_gateway.igw_id
}
output "public_route_table_id" {
  description = "Public Route Table ID"
  value       = module.public_route_table.route_table_id
}


output "elastic_ip_allocation_ids" {
  value = module.elastic_ip.allocation_ids
}

output "elastic_public_ips" {
  value = module.elastic_ip.public_ips
}


output "nat_gateway_ids" {

  value = module.nat_gateway.nat_gateway_ids
}

output "private_route_table_ids" {
  value = module.private_route_table.private_route_table_ids
}