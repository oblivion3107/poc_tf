variable "alarm_name" {
  description = "The name of the CloudWatch alarm."
  type        = string
}

variable "comparison_operator" {
  description = "The comparison operator for the CloudWatch alarm."
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}

variable "metric_name" {
  description = "The name of the metric to be monitored"
  type = string
}

variable "namespace" {
  description = "The name of the provider resource"
  type = string
}

variable "period" {
  description = "The period in which the evaluation is done"
  type = number
}

variable "statistic" {
  description = "The statistic to apply to the metric over the specified period"
  type = string
}

variable "threshold" {
  description = "The threshold value that triggers the alarm"
  type = number
}

variable "alarm_description" {
  description = "It is a description of the alarm"
  type = string
}

variable "instance_id" {
  description = "The id of the instance to which the cloud watch is assigned"
}

variable "alarm_actions" {
  description = "The list of actions to take when the alarm state changes to ALARM"
}

variable "sns_topic_name" {
  description = "The name of the sns topic"
}

variable "email_address" {
  description = "The email address which is to be assigned as the endpoint"
}