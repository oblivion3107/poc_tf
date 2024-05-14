output "cloudwatch_alarm_id" {
  description = "The ID of the CloudWatch alarm."
  value       = aws_cloudwatch_metric_alarm.cpu_utilization_alarm.id
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic."
  value       = aws_sns_topic.my_topic.arn
}