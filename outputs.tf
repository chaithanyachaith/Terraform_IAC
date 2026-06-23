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

output "alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}

output "ec2_security_group_id" {
  value = module.security_groups.ec2_security_group_id
}

output "rds_security_group_id" {
  value = module.security_groups.rds_security_group_id
}

output "alb_id" {

  value = module.alb.alb_id
}

output "alb_arn" {

  value = module.alb.alb_arn
}

output "alb_dns_name" {

  value = module.alb.alb_dns_name
}

output "alb_zone_id" {

  value = module.alb.alb_zone_id
}
output "target_group_arn" {
  value = module.target_group.target_group_arn
}

output "target_group_id" {
  value = module.target_group.target_group_id
}
output "listener_arn" {

  value = module.listener.listener_arn
}
output "launch_template_id" {
  value = module.launch_template.launch_template_id
}

output "launch_template_latest_version" {
  value = module.launch_template.launch_template_latest_version
}

output "asg_name" {
  value = module.auto_scaling.asg_name
}