variable "env" {
    description = "Name of environment"
    type = string
}

variable "vpc_id" {
    description = "ID of VPC"
    type = string
  
}

variable "db_name" {
    description = "Name of DB"
    type = string
}

variable "db_username" {
    description = "User master database"
    type = string
  
}

variable "db_password" {
    description = "Password for DB"
    type = string
    sensitive = true
  
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List IDs for Private subnets"
}