output "allocation_ids" {
  description = "Elastic IP Allocation IDs"

  value = aws_eip.nat[*].id
}

output "public_ips" {
  description = "Elastic IP Addresses"

  value = aws_eip.nat[*].public_ip
}