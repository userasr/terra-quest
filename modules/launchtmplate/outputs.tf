output "launch_template_id" {
  value = aws_launch_template.base-lt.id
}

output "launch_template_latest_version" {
  value = aws_launch_template.base-lt.latest_version
} 