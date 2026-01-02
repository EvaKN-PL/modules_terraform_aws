# AWS Modular Infrastructure with Terraform

This repository contains a modularized AWS infrastructure managed via Terraform. The primary goal of this project is to practice Infrastructure as Code (IaC) best practices, focusing on resource isolation, reusability through modules, and dynamic data fetching.

## 🏗️ Architecture

The project currently implements a highly available network foundation (VPC) featuring:
-**Custom VPC**: A non-default Virtual Private Cloud with a custom CIDR block.
-**Dynamic Networking**: Automatic fetching of Availability Zones (AZs) using Terraform Data Sources.
-**Public Subnets**: Connected to the Internet through an **Internet Gateway**.
-**Private Subnets**: Isolated subnets for secure application deployment.
-**NAT Gateway**: Located in the public tier to allow outgoing internet traffic for resources in private subnets (e.g., for updates).
-**Automated Routing**: Separate route tables for public and private tiers.



## 📂 Project Structure

├── main.tf              # Main configuration calling the modules
├── variables.tf         # Root input variables
├── outputs.tf           # Root outputs (VPC ID, Subnet IDs)
├── terraform.tfvars     # Environment-specific values (Git ignored)
└── modules/
    └── vpc/             # VPC Module
        ├── main.tf      # AWS Networking resources
        ├── variables.tf # Module-specific inputs
        └── outputs.tf   # Module-specific outputs 

🚀 Getting Started

**Prerequisites

    - Terraform installed.
    - AWS CLI configured with appropriate credentials.

🔑 Key Features Learned

   * Module Composition: Passing data between root and child modules.

   * Data Sources: Dynamically discovering AWS infrastructure (AZs).

   * Git Security: Using .gitignore to protect sensitive .tfvars files.

   * Network Security: Implementing NAT Gateways for private subnet isolation.

⚠️ Cost Management

Remember to destroy the infrastructure after training to avoid unnecessary AWS charges (especially for NAT Gateway and Elastic IP)!!