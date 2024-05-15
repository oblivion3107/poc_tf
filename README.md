# Introduction

This document provides the overview of the Terraform configuration script for provisioning the AWS Infrastructure.

# Overview

The aim of this project is to automate the provisioning of the AWS Infrastructure using Terraform. It sets up a Virtual Private Cloud (VPC), subnets, security groups, EC2 Instances, autoscaling groups, load blanacers and monitoring alarms with SNS subscription.

# Installation

1. Install terraform on your local machine.
2. Configure the requried AWS credentials on the local machine using AWS CLI.

# Architecture

The terraform script used in this project follows a modular approach for provisioning of the AWS Infrastructure.

1. It defines the AWS provider with the specified region.
2. Several variables are declard for the customizaton of the infrastructure.
3. Resources such as VPC, subnets, security groups, EC2 Instances, autoscaling groups, load balancers, CloudWatch alarms with SNS topic subscription are provisioned.

# Technologies used 

1. Terraform
2. AWS (Amazon Web Services)
3. Visual studio code (for development)

# Features

1. Provisioning of VPC with customizable CIDR blocks.
2. Creation of public and private subnets across multiple availability zones.
3. Configuration of security groups to control the inbound and outbound traffic.
4. Setting up of EC2 Instances with user data for initilazation.
5. Implementation of autoscaling groups for dynamic scaling.
6. Deployment of load balancers for the distribution of traffic.
7. Monitoring of Ec2 Instance using CloudWatch alarms.

# Usage

1. Naviate to the directory where the terraform script is stored.
2. Initialize terraform:
   terraform init
3. Review the plan:
   terraform plan
4. Apply the changes:
   terraform apply
