\\# Define AWS provider
provider "aws" {
  region = "us-east-1" 
}

# Define variables
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "key_pair_name" {
  description = "The name of the key pair to associate with the EC2 instance"
  default     = "demo key"
}

variable "private_key_path" {
  description = "The path to the private key file for SSH access"
  default     = "./demo_key.pem"
}

variable "email_address" {
  description = "The email address to receive SNS notifications"
  default     = "jhonathanshirly899@gmail.com"
}

# Create VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Store VPC ID in a variable
locals {
  vpc_id = aws_vpc.tf_vpc.id
}

# Create Internet Gateway
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = local.vpc_id
}

# Create Subnet
resource "aws_subnet" "tf_subnet_1" {
  vpc_id            = local.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "tf_subnet_2" {
  vpc_id            = local.vpc_id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1b"
}

# Create Security Group
resource "aws_security_group" "tf_security_group" {
  vpc_id = local.vpc_id

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080  
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 22  
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Store Security Group ID in a variable
locals {
  security_group_id = aws_security_group.tf_security_group.id
}

# Create EC2 Instance
resource "aws_instance" "tf_instance" {
  ami                    = "ami-080e1f13689e07408"  
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tf_subnet_1.id
  security_groups        = [local.security_group_id]
  associate_public_ip_address = true  
  key_name               = var.key_pair_name

   user_data       = <<-EOF
                    #!/bin/bash
                    sudo apt update
                    sudo apt install -y default-jdk
                    sudo apt install -y tomcat9
                    sudo systemctl enable tomcat9
                    sudo systemctl start tomcat9
                    EOF
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Tomcat installed and running!'"
    ]
  }
}

# Create an AMI from the EC2 instance
resource "aws_ami_from_instance" "tf_ami" {
  name               = "my-ami"
  instance_id        = aws_instance.tf_instance.id
  depends_on         = [aws_instance.tf_instance]
}

# Create SNS Topic
resource "aws_sns_topic" "tf_topic" {
  name = "MyTopic"
}

# Subscribe Email to SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.tf_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}

# Create Application Load Balancer
resource "aws_lb" "tf_lb" {
  name               = "tf-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.tf_subnet_1.id, aws_subnet.tf_subnet_2.id]
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "tf_asg" {
  name                 = "tf-asg"
  max_size             = 2
  min_size             = 0
  desired_capacity     = 0
  vpc_zone_identifier = [aws_subnet.tf_subnet_1.id]

  launch_configuration = aws_launch_configuration.tf_lc.name
}

# Create Launch Configuration
resource "aws_launch_configuration" "tf_lc" {
  name_prefix          = "tf-lc-"
  image_id             = aws_ami_from_instance.tf_ami.id 
  instance_type        = "t2.micro"
  security_groups      = [local.security_group_id]

  
   user_data       = <<-EOF
                    #!/bin/bash
                    sudo apt update
                    sudo apt install -y default-jdk
                    sudo apt install -y tomcat9
                    sudo systemctl enable tomcat9
                    sudo systemctl start tomcat9
                    EOF
}

# Create CloudWatch Alarm
resource "aws_cloudwatch_metric_alarm" "my_alarm" {
  alarm_name          = "my-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors CPU utilization"
  dimensions = {
    InstanceId = aws_instance.tf_instance.id
  }
  alarm_actions = [aws_sns_topic.tf_topic.arn]
}

# Update Route Table to route traffic through Internet Gateway
resource "aws_route_table" "tf_route_table" {
  vpc_id = local.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Associate Subnet with the Route Table
resource "aws_route_table_association" "tf_subnet_association" {
  subnet_id      = aws_subnet.tf_subnet_1.id
  route_table_id = aws_route_table.tf_route_table.id
}

output "load_balancer_dns_name" {
  value = aws_lb.tf_lb.dns_name
}
