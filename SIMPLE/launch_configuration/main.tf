resource "aws_launch_configuration" "my_lc" {
  name_prefix          = var.launch_configuration_name_prefix
  image_id             = var.source_instance_id
  instance_type        = var.launch_configuration_instance_type
  key_name             = var.launch_configuration_key_name
  security_groups      = [var.security_group_id]
  user_data            = var.launch_configuration_user_data
}