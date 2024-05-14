output "security_group_id" {
  description = "The ID of the security group created by the Security Group module."
  value       = aws_security_group.my_security_group.id  # Assuming aws_security_group.my_security_group is the resource defining the security group
}