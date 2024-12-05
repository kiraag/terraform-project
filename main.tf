
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"                   # Provide the CIDR block for the VPC
  private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"] # Provide CIDR blocks for private subnets
}


module "security_group" {
  source      = "./modules/security-group"
  vpc_id      = module.vpc.vpc_id
  ingress_ports = var.ingress_ports
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_ids        = module.vpc.private_subnet_ids  # Correct reference from the VPC module
  security_group_ids = [module.security_group.security_group_id]
}


module "s3" {
  source = "./modules/s3"
  bucket_name = var.bucket_name
}

module "rds" {
  source             = "./modules/rds"
  db_username        = var.db_username       # Pass from root module variables
  db_password        = var.db_password       # Pass from root module variables
  db_name            = var.db_name           # Pass from root module variables
  security_group_ids = [module.security_group.security_group_id]  # Correct reference
  subnet_ids         = module.vpc.private_subnet_ids  # Reference private subnets for RDS
}

