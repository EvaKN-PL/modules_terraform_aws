variable "env" {
    description = "Type of environment"
    type        = string
}

variable "vpc_id" {
    description = "ID of VPC"
    type        = string

}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List ID from module network"
}

variable "certificate_arn" {
    description = "The ARN of the SSL certificate created in Amazon Certificate Manager"
    type        = string
  
}