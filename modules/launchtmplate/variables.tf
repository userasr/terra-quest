variable "ami_id" {
  description = "AMI ID to use for the launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "user_data" {
  description = "User data script for EC2 instances"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "key_name" {
  description = "Key name for the launch template"
  type        = string
}

variable "project_name" {
  description = "Provide project name"
  type        = string
}