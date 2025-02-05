module "vpc" {
  source               = "./module/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_1      = var.public_subnet_1
  public_subnet_2      = var.public_subnet_2
  private_subnet_1     = var.private_subnet_1
  private_subnet_2     = var.private_subnet_2
  public_subnet_az_1   = var.public_subnet_az_1
  public_subnet_az_2   = var.public_subnet_az_2
  private_subnet_az_1  = var.private_subnet_az_1
  private_subnet_az_2  = var.private_subnet_az_2
}

 module "ec2" {
  source        = "./module/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_1_id
  security_group_id = module.ec2.app_sg_id
}

module "db" {
  source              = "./module/db"
  vpc_id             = module.vpc.vpc_id
  db_username        = var.db_username
  db_password        = var.db_password
  db_instance_class  = var.db_instance_class
  allocated_storage  = var.allocated_storage
  private_subnet_ids = module.vpc.private_subnet_ids
  db_sg_id           = module.vpc.db_sg_id  # ✅ Correctly passing from VPC module
}



module "load_balancer" {
  source            = "./module/load_balancer"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.vpc.alb_sg_id
 
}