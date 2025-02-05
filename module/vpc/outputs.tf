# In module/vpc/outputs.tf

# Output VPC ID
output "vpc_id" {
  value = aws_vpc.three_tier_vpc.id
}

# Output Public Subnet IDs
output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

# Output Private Subnet IDs
output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}


output "db_sg_id" {
  value = aws_security_group.db_sg.id
}


output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]
}
output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
}
