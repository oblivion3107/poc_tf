variable "launch_configuration_name_prefix" {
  description = "The prefix for the name of the launch configuration."
  type        = string
}

variable "source_instance_id" {
  description = "The ID of the source instance for the launch configuration"
  type        = string
}

variable "launch_configuration_instance_type" {
  description = "The instance type for the launch configuration."
  type        = string
}

variable "launch_configuration_key_name" {
  description = "The name of the SSH key pair used by the launch configuration."
  type        = string
}

variable "security_group_id" {
 # description = "The list of security group IDs associated with the launch configuration."
  #type        = list(string)
}

variable "launch_configuration_user_data" {
  description = "The user data to be provided to the instances launched by the launch configuration."
  type        = string
}