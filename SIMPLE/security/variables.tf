variable "vpc_id" {
  description = "ID of the VPC to associate the security group with."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "ssh_from_port" {
  description = "Start of port range for SSH access."
  type        = number
  default     = 22
}

variable "ssh_to_port" {
  description = "End of port range for SSH access."
  type        = number
  default     = 22
}

variable "http_from_port" {
  description = "Start of port range for HTTP access."
  type        = number
  default     = 80
}

variable "http_to_port" {
  description = "End of port range for HTTP access."
  type        = number
  default     = 80
}

variable "custom_port_from" {
  description = "Start of port range for custom access."
  type        = number
  default     = 8080
}

variable "custom_port_to" {
  description = "End of port range for custom access."
  type        = number
  default     = 8080
}

variable "egress_from_port" {
  description = "Start of port range for egress traffic."
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "End of port range for egress traffic."
  type        = number
  default     = 0
}

variable "security_group_name" {
  description = "Name for the security group."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

# Define other variables specific to the security module...