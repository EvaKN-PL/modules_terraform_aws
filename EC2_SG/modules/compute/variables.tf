variable "env" {
    description = "Name of environment"
    type = string
}

variable "vpc_id" {
    description = "ID of VPC"
    type = string
  
}

variable "subnet_id" {
    description = "ID of public subnet"
    type = string
  
}

variable "instance_type" {
    description = "Type of instance"
    type = string
  
}
variable "my_ip" {
  description = "Public IP fetched automatically"
  type        = string
}