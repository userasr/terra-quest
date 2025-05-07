output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.quest-sg.id
}

output "security_group_name" {
  description = "Name of the created security group"
  value       = aws_security_group.quest-sg.name
} 
