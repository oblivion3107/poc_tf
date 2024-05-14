# ec2/main.tf

resource "aws_instance" "my_ec2_instance" {
  ami                        = var.ami_id
  instance_type              = var.instance_type
  key_name                   = var.key_name
  subnet_id                  = var.subnet_id
  security_groups            = [var.security_group_id]
  associate_public_ip_address = true

  user_data = var.user_data

  tags = {
    Name = var.ec2_instance_name
  }
}