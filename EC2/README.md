# Compute Module

This module manages the provisioning of EC2 instances and associated security resources. It is designed to work in tandem with a networking module that provides VPC and Subnet infrastructure.

🏗️ Architecture

This module follows a decoupled architecture where networking resources are injected as variables. It specifically requires:
1. **VPC ID**: To associate Security Groups.
2. **Subnet ID**: To place the EC2 instance in a specific network segment (usually a public subnet provided by the Network module).



🔑 Features

 1. `EC2 Instance Provisioning`: Creates an Amazon Linux 2023 instance.
 
 2. `Security Groups`: Automatically sets up an EC2 Security Group with dynamic SSH access rules.
    
 3. `SSH Access`: Uses an existing AWS Key Pair for secure authentication.

## Usage

```hcl
# Example of how to connect the Network module with the Compute module
module "network" {
  source = "./modules/vpc"
  # ... network variables
}

module "compute" {
  source        = "./modules/compute"
  env           = "dev"
  
  # Dependencies from Network Module
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.public_subnet_ids[0]
  
  instance_type = "t3.micro"
  key_name      = "my-existing-aws-key"
  my_ip         = "1.2.3.4/32"
}
```

⚠️Cost Management

Remember to destroy the infrastructure after training to avoid unnecessary AWS charges (especially for NAT Gateway and Elastic IP)!!

```bash
terraform destroy
```
