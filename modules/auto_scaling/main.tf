resource "aws_autoscaling_group" "this" {

  name = var.asg_name

  min_size = var.min_size

  max_size = var.max_size

  desired_capacity = var.desired_capacity

  vpc_zone_identifier = var.private_subnet_ids

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  launch_template {

    id = var.launch_template_id

    version = "$Latest"
  }

  tag {

    key = "Name"

    value = "Application-Server"

    propagate_at_launch = true
  }
}