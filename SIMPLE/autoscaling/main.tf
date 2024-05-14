resource "aws_autoscaling_group" "my_asg" {
  name                      = var.asg_name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.vpc_zone_identifiers
  launch_configuration      = var.launch_configuration_name
  target_group_arns         = var.target_group_arns
  

  tag {
    key                 = "Name"
    value               = var.tag_name
    propagate_at_launch = true
  }
}