output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

# output "db_endpoint" {
#   value = module.db.db_endpoint
# }
