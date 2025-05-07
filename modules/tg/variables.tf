variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "target_group_settings" {
  description = "Settings for the target group"
  type = object({
    port                = number
    protocol            = string
    health_check_path   = string
    health_check_port   = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval           = number
    matcher            = string
  })
  default = {
    port                = 80
    protocol            = "HTTP"
    health_check_path   = "/"
    health_check_port   = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval           = 30
    matcher            = "200"
  }
}

variable "project_name" {
  description = "Provide project name"
  type        = string
}