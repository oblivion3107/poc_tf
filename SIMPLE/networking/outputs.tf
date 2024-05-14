output "vpc_id" {
  description = "ID of the VPC created"
  value       = aws_vpc.my_vpc.id  # Assuming aws_vpc.my_vpc is the resource defining the VPC
}

output "subnet1_id" {
  description = "The ID of subnet1 created by the Networking module."
  value       = aws_subnet.subnet1.id  # Assuming aws_subnet.subnet1 is the resource defining subnet1
}

output "subnet2_id" {
  description = "The ID of subnet2 created by the Networking module."
  value       = aws_subnet.subnet2.id  # Assuming aws_subnet.subnet2 is the resource defining subnet2
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway created by the Networking module."
  value       = aws_internet_gateway.my_igw.id  # Assuming aws_internet_gateway.my_igw is the resource defining the Internet Gateway
}

output "route_table_id" {
  description = "The ID of the route table created by the Networking module."
  value       = aws_route_table.my_route_table.id  # Assuming aws_internet_gateway.my_igw is the resource defining the Internet Gateway
}
