# 🏗️ AWS Application Load Balancer (ALB) Terraform Module

This module provisions a fully functional **Application Load Balancer (ALB)** with a strong focus on security and automated HTTPS traffic management. 🔒

📝 Architecture Overview
This module manages the entry point of your infrastructure.

⚠️ ```Note```: This module ```does not``` create EC2 instances or ECS services. It defines the Target Group and Listeners, which must be connected to your compute resources (e.g., Compute module) via a `Target Group Attachment`.

✨ Features

🛠️ Dual Listeners: Port 80 (HTTP) automatically redirects traffic to Port 443 (HTTPS).

🔐 SSL Termination: Fully integrated with AWS Certificate Manager (ACM).

🛡️ Security: Includes a dedicated Security Group for the ALB.

🩺 Health Checks: Pre-configured health checks to ensure target reliability.

🚀 Usage

To use this module, call it from your root `main.tf` and pass the required outputs from your networking (VPC) module.

```hcl
module "loadbalancer" {
    source            = "./modules/loadbalancer"
    env               = var.env
    vpc_id            = module.network.vpc_id
    public_subnet_ids = module.network.public_subnet_ids
    certificate_arn   = var.certificate_arn
}
```
📥 Inputs
|        Name       |                            Description                           |     Type     | Required |
|:-----------------:|:----------------------------------------------------------------:|:------------:|:--------:|
|        env        |                         Environment name                         |    string    |    yes   |
|       vpc_id      | Environment nameThe ID of the VPC where the ALB will be deployed |    string    |    yes   |
| public_subnet_ids |               List of Public Subnet IDs for the ALB              | list(string) |    yes   |
|       region      |                           Region in AWS                          |    string    |    yes   |
|  certificate_arn  |       The ARN of the ACM certificate for the HTTPS listener      |    string    |    yes   |

📤 Outputs

|   Name   |                Description               |  Type  | Required |
|:--------:|:----------------------------------------:|:------:|:--------:|
| dns_name | The public DNS name of the Load Balancer | string |    yes   |

🔗 Connecting to Compute (EC2)

Since this module does not create instances, you must attach your EC2 servers in your compute module or root level using the following resource:
```Terraform
resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = module.alb.alb_target_group_arn
  target_id        = aws_instance.my_web_server.id
  port             = 80
}
```
💡Tip: Always ensure that your EC2 Security Group allows inbound traffic from module.alb.alb_security_group_id on the application port!
