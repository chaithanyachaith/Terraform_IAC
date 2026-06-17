output "subnet_ids" {
  value = {
    for name, subnet in aws_subnet.this :
    name => subnet.id
  }
}