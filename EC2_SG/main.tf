data "http" "my_public_ip" {
  url = "https://ifconfig.me/ip"
}


module "network" {
    source = "../Network/modules/vpc"
    env = "dev"
    vpc_cidr = "10.0.0.0/16" 
    public_subnet_cidr = [ "10.0.1.0/24", "10.0.2.0/24" ]
    private_subnet_cidr = [ "10.0.10.0/24", "100.0.11.0/24" ]

  
}
module "compute" {
    source = "./modules/compute"
    env = "dev"
    vpc_id = module.network.vpc_id
    subnet_id = module.network.public_subnet_ids[0]
    my_ip = "${chomp(data.http.my_public_ip.response_body)}/32"
    instance_type = "t2.micro"
  
}