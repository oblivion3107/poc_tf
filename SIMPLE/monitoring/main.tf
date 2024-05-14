# CloudWatch metric alarm for CPU utilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  alarm_description   = var.alarm_description

  dimensions = {
    InstanceId = var.instance_id
  }

  alarm_actions = [var.alarm_actions]
}

# SNS topic
resource "aws_sns_topic" "my_topic" {
  name = var.sns_topic_name
}

# SNS topic subscription
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}