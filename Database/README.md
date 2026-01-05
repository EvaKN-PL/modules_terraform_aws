🗄️ RDS MySQL Module

This module provisions a managed AWS RDS MySQL instance within a private network segment.

  🌟 Features

   🔒 Network Isolation: The database is deployed in private subnets with publicly_accessible = false.

   🌐 Subnet Management: Automatically creates a DB Subnet Group required for RDS deployment.

   🛡️ Security: Creates a dedicated Security Group for the database instance.

🚀 Usage

```hcl
module "database" {
  source             = "./modules/rds"
  env                = "dev"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  
  db_name            = "var.db_name"
  db_user            = "var.db_username"
  db_password        = var.db_password # Should be marked as sensitive
}
```

🔌 Connectivity Requirements

  ```Important: By default, this module creates a Security Group with no inbound rules. To connect to the database, you must:```

  🖥️ Deploy a Bastion/App Host: Create an EC2 instance (e.g., using a compute module) in the same VPC.

  🚥 Add Security Group Rules: You need to add an aws_security_group_rule or a resource "aws_vpc_security_group_ingress_rule" that allows traffic on port 3306 from the EC2 Security Group to the RDS Security Group.

 📥 Inputs

<img width="500" height="300" alt="variables" src="https://github.com/user-attachments/assets/d0205e93-535a-49ea-bf86-0d13cd0d72d8" />


📤 Outputs

```
   db_instance_endpoint - The connection endpoint for the RDS instance
   db_instance_id - The ID of the RDS instance
```
