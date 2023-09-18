resource "aws_launch_template" "foobar" {
  name_prefix   = "${var.env_name}"
  image_id      = var.ami_id
  instance_type = var.instance_type
  # user_data     =   "${file("install_apache.sh")}"
    user_data = filebase64("install_apache.sh")

  vpc_security_group_ids  =  [var.vpc_security_group_ids_ssh, var.vpc_security_group_ids_http]
}
resource "aws_autoscaling_group" "terraform-_asg" {

#   availability_zones = ["us-east-1a","us-east-1b"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2

  launch_template {
    id      = aws_launch_template.foobar.id
        # version = "$Latest"
        version = "$Latest"

  }
  target_group_arns=  [var.alb_target_group]
  vpc_zone_identifier=[var.subnet_id, var.subnet_id_2]
}