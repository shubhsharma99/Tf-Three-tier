resource "aws_db_instance" "mydb" {
  identifier             = "my-db-instance"
  engine                 = "mysql"
  instance_class         = var.db_instance_class
  allocated_storage      = var.allocated_storage
  storage_type           = "gp2"
  engine_version         = "8.0"
  username              = var.db_username
  password              = var.db_password
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [var.db_sg_id]  
  skip_final_snapshot    = true
}


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Allow MySQL inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 🔴 Restrict this in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-security-group"
  }
}
