
resource "aws_launch_template" "base-lt" {
  name_prefix   = "${var.project_name}-${var.environment}-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups            = var.security_group_ids
  }

  user_data = base64encode(var.user_data)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-${var.environment}-instance"
      Environment = var.environment
    }
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-launch-template"
    Environment = var.environment
  }
}
