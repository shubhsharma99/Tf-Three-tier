variable "vpc_id" {
  description = "VPC ID where the database security group will be created"
  type        = string
}

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

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the DB"
  type        = list(string)
}
variable "db_sg_id" {
  description = "Security group ID for the RDS instance"
  type        = string
}
