output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.base-tg.arn
}
