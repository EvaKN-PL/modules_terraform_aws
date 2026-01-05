# AWS Modular Infrastructure with Terraform


This repository contains a collection of custom, reusable Terraform modules designed to provision and manage infrastructure on AWS. The project follows a modular architecture, promoting code reusability and maintainability.

<img width="1024" height="500" alt="Gemini_Generated_Image_f06cj4f06cj4f06c" src="https://github.com/user-attachments/assets/9b41e416-913d-45e4-83c7-7508f1e601a4" />


🏗 Repository Structure

The modules are organized into subdirectories, each representing a specific infrastructure component:

  * modules/vpc/: (Network) Manages VPC creation, public/private subnets, Internet Gateways, and Route Tables.

  *   modules/compute/: (Compute) Handles EC2 instances, Security Groups, and SSH key associations.

   ... more modules to come (S3, RDS, IAM, etc.)

   

🚀 Getting Started
Prerequisites

  1. Terraform: >= 1.0.0

  2. AWS CLI: Configured with appropriate credentials.

  3. SSH Key: An existing AWS Key Pair (if using the compute module).

     

🛠 Development Workflow

  ```Initialize```: Run terraform init to download providers and initialize modules.

  ```Validate```: Use terraform validate to check for syntax errors.

  ```Plan```: Run terraform plan to see the execution plan.

  ```Apply```: Execute terraform apply to deploy the infrastructure.

  

📝 Best Practices applied

  ```Decoupling```: Modules are independent; networking is separated from compute logic.

  ```Inter-module Communication```: Using outputs from one module as inputs for another.

  ```Tagging```: Consistent naming conventions using an env variable.

  ```Documentation```: Each module contains its own specific README.md.
