output "ec2_instance_id" {
  value = aws_instance.app_server.id
}
output "app_sg_id" {
  value = aws_security_group.app_sg.id  # ✅ Correct: Security Group is in the EC2 module
}


