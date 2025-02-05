resource "aws_instance" "app_server" {
  ami           = "ami-04b4f1a9cf54c11d0" # Change based on your region
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "AppServer"
  }
}
resource "aws_security_group" "app_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}