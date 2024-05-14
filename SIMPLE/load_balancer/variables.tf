variable "vpc_id" {
  description = "ID of the VPC where the load balancer will be deployed."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "alb_name" {
  description = "Name for the Application Load Balancer (ALB)."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "alb_internal" {
  description = "Whether the ALB should be internal (true) or external (false)."
  type        = bool
  # You can set a default value here or provide it when running Terraform.
}

variable "alb_type" {
  description = "Type of the ALB."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "alb_subnets" {
  description = "List of subnet IDs to associate with the ALB."
  type        = list(string)
  # You can set a default value here or provide it when running Terraform.
}

variable "security_group_id" {
  description = "ID of the security group to associate with the ALB."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "target_group_name" {
  description = "Name for the target group."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "target_group_port" {
  description = "Port for the target group."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "target_group_protocol" {
  description = "Protocol for the target group."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_interval" {
  description = "Interval (in seconds) for the health check."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_path" {
  description = "Path for the health check."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_port" {
  description = "Port for the health check."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_protocol" {
  description = "Protocol for the health check."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_timeout" {
  description = "Timeout (in seconds) for the health check."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_healthy_threshold" {
  description = "Threshold for considering the target healthy."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "health_check_unhealthy_threshold" {
  description = "Threshold for considering the target unhealthy."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "listener_port" {
  description = "Port for the ALB listener."
  type        = number
  # You can set a default value here or provide it when running Terraform.
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

# Define other variables specific to the load balancer module...