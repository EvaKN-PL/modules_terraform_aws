provider "aws" {
    region = var.region
  
}

module "network" {
    source              = "../Network/modules/vpc"
    env                 = var.env
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidr  = [ "10.0.1.0/24", "10.0.2.0/24" ]
    private_subnet_cidr = [ "10.0.10.0/24", "100.0.11.0/24" ]
  
}

module "loadbalancer" {
    source            = "./modules/loadbalancer"
    env               = var.env
    vpc_id            = module.network.vpc_id
    public_subnet_ids = module.network.public_subnet_ids
    certificate_arn   = var.certificate_arn
    
  
}