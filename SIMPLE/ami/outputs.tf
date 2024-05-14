output "ami_id" {
    value = aws_ami_from_instance.my_ec2_instance_ami.id
  
}