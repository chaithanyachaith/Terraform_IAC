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