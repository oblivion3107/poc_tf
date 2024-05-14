variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet1_cidr_block" {
  description = "CIDR block for Subnet 1."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet1_availability_zone" {
  description = "Availability zone for Subnet 1."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet2_cidr_block" {
  description = "CIDR block for Subnet 2."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet2_availability_zone" {
  description = "Availability zone for Subnet 2."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "igw_name" {
  description = "Name for the Internet Gateway."
  type        = string
  # You can set a default value here or provide it when running Terraform.
}

variable "subnet1_id" {
  description = "ID of the subnet to associate with the route table."
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC for which the route table will be created."
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the internet gateway id for which the route table will be created."
  type        = string
}