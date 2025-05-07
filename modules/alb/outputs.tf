
output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.base-lb.dns_name
}

output "alb_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.base-lb.arn
}

output "https_listener_arn" {
  description = "ARN of the HTTPS listener"
  value       = aws_lb_listener.https.arn
} 