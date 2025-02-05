# VPC
vpc_cidr               = "10.0.0.0/16"

public_subnet_1        = "10.0.1.0/24"
public_subnet_2        = "10.0.2.0/24"

private_subnet_1       = "10.0.3.0/24"
private_subnet_2       = "10.0.4.0/24"

public_subnet_az_1     = "us-east-1a"
public_subnet_az_2     = "us-east-1b"

private_subnet_az_1    = "us-east-1a"
private_subnet_az_2    = "us-east-1b"

#---------------------------------------------------------------
# # EC2 Instance Configuration (App Tier)

app_instance_type = "t2.micro"
app_ami_id        = "ami-0c55b159cbfafe1f0" # Change based on your AWS region


#---------------------------------------------------------------
# Database Configuration (DB Tier)

db_username       = "admin"
db_password       = "SuperSecurePassword123"
db_instance_class = "db.t3.micro"
allocated_storage = 20
db_sg_id          = "sg-xxxxxxxxxxxx"
private_subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

# # # AWS Configuration
aws_region = "us-east-1"
