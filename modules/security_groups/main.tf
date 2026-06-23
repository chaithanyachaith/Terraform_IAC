resource "aws_security_group" "alb" {

  name        = var.alb_sg_name
  description = "ALB Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.alb_sg_name
  }
}

resource "aws_security_group" "ec2" {

  name        = var.ec2_sg_name
  description = "EC2 Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.ec2_sg_name
  }
}

resource "aws_security_group" "rds" {

  name        = var.rds_sg_name
  description = "RDS Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.rds_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80
  to_port   = 80

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443
  to_port   = 443

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "alb_outbound" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "ec2_http" {

  security_group_id = aws_security_group.ec2.id

  referenced_security_group_id = aws_security_group.alb.id

  from_port = 80
  to_port   = 80

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "ec2_outbound" {

  security_group_id = aws_security_group.ec2.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "rds_mysql" {

  security_group_id = aws_security_group.rds.id

  referenced_security_group_id = aws_security_group.ec2.id

  from_port = 3306
  to_port   = 3306

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "rds_outbound" {

  security_group_id = aws_security_group.rds.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"
}

