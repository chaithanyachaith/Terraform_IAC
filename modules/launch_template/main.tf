resource "aws_launch_template" "this" {

  name_prefix = var.launch_template_name

  image_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  user_data = base64encode(file(var.user_data_file))

  update_default_version = true

  tags = {
    Name = var.launch_template_name
  }
}