# Create VPC
resource "aws_vpc" "three_tier_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = "three-tier-vpc"
  }
}

# Create Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.three_tier_vpc.id
}

# Create First Public Subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.public_subnet_1
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az_1

  tags = {
    Name = "three-tier-public-subnet-1"
  }
}

# Create Second Public Subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = var.public_subnet_2
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az_2

  tags = {
    Name = "three-tier-public-subnet-2"
  }
}


# Create First Private Subnet
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = var.private_subnet_1
  availability_zone = var.private_subnet_az_1

  tags = {
    Name = "three-tier-private-subnet-1"
  }
}

# Create Second Private Subnet
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = var.private_subnet_2
  availability_zone = var.private_subnet_az_2

  tags = {
    Name = "three-tier-private-subnet-2"
  }
}

# Allocate Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Create NAT Gateway in First Public Subnet
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "three-tier-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}

# Create Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.three_tier_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate First Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate Second Public Subnet with Public Route Table
resource "aws_route_table_association" "public_assoc_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# Create Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.three_tier_vpc.id
  
  route {
    cidr_block       = "0.0.0.0/0"
    nat_gateway_id   = aws_nat_gateway.nat_gateway.id
  }
  
}

# Associate First Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

# Associate Second Private Subnet with Private Route Table
resource "aws_route_table_association" "private_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}




resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.three_tier_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#----------------------------------------------------

resource "aws_security_group" "db_sg" {
  name        = "db-security-group"
  description = "Allow MySQL inbound traffic"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
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

