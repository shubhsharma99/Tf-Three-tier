# AWS Region
variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_1" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_2" {
  description = "CIDR block for the public subnet"
  type        = string
}
variable "private_subnet_1" {
  description = "CIDR block for the private subnet"
  type        = string
}
variable "private_subnet_2" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "public_subnet_az_1" {
  description = "The availability zone for the first public subnet"
  type        = string
}

variable "public_subnet_az_2" {
  description = "The availability zone for the second public subnet"
  type        = string
}

variable "private_subnet_az_1" {
  description = "The availability zone for the first private subnet"
  type        = string
}

variable "private_subnet_az_2" {
  description = "The availability zone for the second private subnet"
  type        = string
}
#------------------------------------------------------------------------------------
# # EC2 Instance Configuration (App Tier)

variable "app_instance_type" {
  description = "EC2 instance type for the application tier"
  type        = string
}

variable "app_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}



#---------------------------------------------------------------------------------
# # Database Configuration (DB Tier)


variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance type of the database"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "The storage allocated to the database"
  type        = number
  default     = 20
}

variable "db_sg_id" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the DB"
  type        = list(string)
}
