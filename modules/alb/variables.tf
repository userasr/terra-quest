variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "ssl_certificate_arn" {
  description = "ARN of SSL certificate to use for HTTPS listener"
  type        = string
}

variable "tg_arn" {
  description = "ARN of the target group"
  type        = string
}

variable "project_name" {
  description = "Provide project name"
  type        = string
}