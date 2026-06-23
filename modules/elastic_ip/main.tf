resource "aws_eip" "nat" {

  count = var.eip_count

  domain = "vpc"

  tags = {
    Name = "${var.eip_name}-${count.index + 1}"
  }
}