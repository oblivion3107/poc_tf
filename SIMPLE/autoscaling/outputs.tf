output "asg_name" {
  description = "The name of the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.name
}

output "asg_arn" {
  description = "The ARN of the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.arn
}

output "asg_min_size" {
  description = "The minimum number of instances in the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.min_size
}

output "asg_max_size" {
  description = "The maximum number of instances in the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.max_size
}

output "asg_desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.desired_capacity
}

output "asg_vpc_zone_identifiers" {
  description = "The list of subnet IDs associated with the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.vpc_zone_identifier
}

output "asg_launch_configuration_name" {
  description = "The name of the launch configuration used by the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.launch_configuration
  
}

output "asg_target_group_arns" {
  description = "The list of target group ARNs associated with the Auto Scaling Group."
  value       = aws_autoscaling_group.my_asg.target_group_arns
}