resource "aws_nat_gateway" "this" {

  count = length(var.public_subnet_ids)

  allocation_id = var.allocation_ids[count.index]

  subnet_id = var.public_subnet_ids[count.index]

  tags = {
    Name = "${var.nat_gateway_name}-${count.index + 1}"
  }

  depends_on = [var.igw_id]
}