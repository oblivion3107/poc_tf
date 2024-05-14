variable "asg_name" {
  description = "The name of the Auto Scaling Group."
  type        = string
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling Group."
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling Group."
  type        = number
}

variable "desired_capacity" {
  description = "The desired capacity of the Auto Scaling Group."
  type        = number
}

variable "vpc_zone_identifiers" {
  description = "The list of subnet IDs associated with the Auto Scaling Group."
  type        = list(string)
}

variable "launch_configuration_name" {
  description = "The name of the launch configuration used by the Auto Scaling Group."
type        = string
}

variable "target_group_arns" {
  description = "The list of target group ARNs associated with the Auto Scaling Group."
  type        = list(string)
}

variable "tag_name" {
  description = "The value of the 'Name' tag to be applied to resources created by the Auto Scaling Group."
  type        = string
}