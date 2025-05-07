variable "launch_template_id" {
  description = "ID of the launch template"
  type        = string
}

variable "launch_template_version" {
  description = "Version of the launch template to use"
  type        = string
}

variable "vpc_subnet_ids" {
  description = "List of subnet IDs for the ASG"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of target group ARNs"
  type        = list(string)
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "min_size" {
  description = "Minimum size of the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum size of the ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired capacity of the ASG"
  type        = number
  default     = 2
}

variable "project_name" {
  description = "Provide project name"
  type        = string
}