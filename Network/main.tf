provider "aws" {
    region = var.region
  
}

module "network" {
    source = "./modules/vpc"
    env = "dev"
    vpc_cidr = "10.0.0.0/16" 
    public_subnet_cidr = [ "10.1.0.0/24", "10.2.0.0/24" ]
    private_subnet_cidr = [ "10.0.10.0/24", "10.0.11.0/24" ]
  
}