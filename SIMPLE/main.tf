# Define the provider
provider "aws" {
  region = "us-east-1"  # You can set your desired AWS region here
}

# Include the networking module
module "networking" {
  source = "./networking"  # Path to the networking module directory

  # Define input variables for the networking module
  region                     = "us-east-1"
  vpc_cidr_block             = "10.0.0.0/16"
  subnet1_cidr_block         = "10.0.1.0/24"
  subnet1_availability_zone  = "us-east-1a"
  subnet2_cidr_block         = "10.0.2.0/24"
  subnet2_availability_zone  = "us-east-1b"
  igw_name                   = "MyIGW"
  vpc_id                     = module.networking.vpc_id
  subnet1_id                 = module.networking.subnet1_id
  route_table_id             = module.networking.route_table_id
  internet_gateway_id        = module.networking.internet_gateway_id
}

# Include the security group module
module "security_group" {
  source = "./security"  # Path to the security group module directory

  # Define input variables for the security group module
  vpc_id                   = module.networking.vpc_id
  security_group_name      = "MySecurityGroup"
}

# Include the EC2 instance module
module "ec2_instance" {
  source = "./ec2"  # Path to the EC2 instance module directory

  # Define input variables for the EC2 instance module
  ami_id                 = "ami-080e1f13689e07408"
  instance_type          = "t2.micro"
  key_name               = "demo key"
  subnet_id              = module.networking.subnet1_id
  security_group_id      = module.security_group.security_group_id
  user_data              = <<-EOF
                            #!/bin/bash
                            sudo apt-get update -y
                            sudo apt-get install -y openjdk-1.8*
                            sudo apt-get install -y tomcat10
                            sudo systemctl enable tomcat10
                            sudo systemctl start tomcat10
                            EOF

  ec2_instance_name = "MyInstance"
}

module "ami" {
  source = "./ami"

  ami_name = "image" 
  source_instance_id = module.ec2_instance.instance_id
}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "110s"
}

# Include the load balancer module
module "load_balancer" {
  source = "./load_balancer"  # Path to the load balancer module directory

  # Define input variables for the load balancer module
  vpc_id                             = module.networking.vpc_id  # Retrieve VPC ID from the Networking module
  alb_name                           = "my-alb"
  alb_internal                       = false
  alb_type                           = "application"
  alb_subnets                        = [module.networking.subnet1_id, module.networking.subnet2_id]
  security_group_id                  = module.security_group.security_group_id
  target_group_name                  = "my-target-group"
  target_group_port                  = 8080
  target_group_protocol              = "HTTP"
  health_check_interval              = 30
  health_check_path                  = "/"
  health_check_port                  = 8080
  health_check_protocol              = "HTTP"
  health_check_timeout               = 5
  health_check_healthy_threshold     = 5
  health_check_unhealthy_threshold   = 2
  listener_port                      = 80
  listener_protocol                  = "HTTP"
}

module "alerts" {
  source = "./monitoring"
  
  alarm_name = "CPUUtilizationAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 2
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300  
  statistic = "Average"
  threshold = 80
  alarm_description = "Alarm when CPU utilization exceeds 80%"
  instance_id = module.networking.vpc_id
  sns_topic_name = "Email_subscription"
  alarm_actions = module.alerts.sns_topic_arn
  email_address = "jhonathanshirly899@gmail.com"
}

# Include Auto Scaling Group module
module "autoscaling" {
  source = "./autoscaling"
    
  asg_name                = "my-asg"
  max_size                = 3
  min_size                = 1
  desired_capacity        = 1
  vpc_zone_identifiers    = [module.networking.subnet1_id, module.networking.subnet2_id]
  launch_configuration_name   = module.launch_configuration.launch_configuration_id
  target_group_arns       = [module.load_balancer.target_group_arn]
  tag_name = "ASG"
}

module "launch_configuration" {
  source = "./launch_configuration"

  launch_configuration_name_prefix = "my-lc-"
  source_instance_id = module.ami.ami_id
  launch_configuration_instance_type = "t2.micro"
  launch_configuration_key_name    = "demo key"
  security_group_id = module.security_group.security_group_id
  launch_configuration_user_data   = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo systemctl enable tomcat10
    sudo systemctl start tomcat10
    
  EOF
}
