provider "aws" {
    region = var.region
  
}

## Calling the network module
module "network" {
    source = "../Network/modules/vpc"
    env = var.env
    vpc_cidr = "10.0.0.0/16" 
    public_subnet_cidr = [ "10.0.1.0/24", "10.0.2.0/24" ] ## example
    private_subnet_cidr = [ "10.0.10.0/24", "10.0.11.0/24" ] ## example
  
}

module "database" {
    source = "./modules/rds"
    env = var.env

    vpc_id = module.network.vpc_id
    private_subnet_ids = module.network.private_subnet_ids

    db_name = var.db_name
    db_username = var.db_username
    db_password = var.db_password

  
}