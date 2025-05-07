# Create Target Group
resource "aws_lb_target_group" "base-tg" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = var.target_group_settings.port
  protocol = var.target_group_settings.protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    path                = var.target_group_settings.health_check_path
    port                = var.target_group_settings.health_check_port
    healthy_threshold   = var.target_group_settings.healthy_threshold
    unhealthy_threshold = var.target_group_settings.unhealthy_threshold
    timeout             = var.target_group_settings.timeout
    interval            = var.target_group_settings.interval
    matcher             = var.target_group_settings.matcher
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-tg"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
