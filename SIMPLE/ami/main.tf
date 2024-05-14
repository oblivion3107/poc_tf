resource "aws_ami_from_instance" "my_ec2_instance_ami" {
  name                = var.ami_name
  source_instance_id  = var.source_instance_id
  }