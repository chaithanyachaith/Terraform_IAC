output "db_subnet_group_name" {
  description = "Name of the DB Subnet Group"
  value       = aws_db_subnet_group.this.name
}

output "db_subnet_group_id" {
  description = "ID of the DB Subnet Group"
  value       = aws_db_subnet_group.this.id
}