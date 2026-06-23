resource "aws_lb_target_group" "this" {

  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  target_type = "instance"

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = {
    Name = var.target_group_name
  }
}