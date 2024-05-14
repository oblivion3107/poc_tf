variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "instance_type" {
  description = "Type of EC2 instance to launch."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "key_name" {
  description = "Name of the EC2 key pair to associate with the instance."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet_id" {
  description = "ID of the subnet to launch the instance in."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "security_group_id" {
  description = "ID of the security group to associate with the instance."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "user_data" {
  description = "User data script to run on the instance at launch."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "ec2_instance_name" {
  description = "Name for the EC2 instance."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

# Define other variables specific to the EC2 module...