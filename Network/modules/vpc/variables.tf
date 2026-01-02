variable "vpc_cidr" {
    description = "Range IPs for VPC "
    type = string 
}

variable "public_subnet_cidr" {
    description = "List of CIDR for public subnets"
    type = list(string)
}

variable "private_subnet_cidr" {
    description = "List of CIDR for private subnets"
    type = list(string)   
}

variable "env" {
    description = "Name of environment"
    type = string
  
}


