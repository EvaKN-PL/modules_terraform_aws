variable "region" {
    description = "Region in AWS"
    type = string
}

variable "env" {
    description = "Type of environment"
    type        = string
}

variable "certificate_arn" {
    description = "The ARN of the SSL certificate created in Amazon Certificate Manager"
    type        = string
  
}