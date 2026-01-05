variable "instance_type" {
    description = "Type of instance"
    type = string
  
}

variable "key_name" {
  description = "Name of SSH key in AWS"
  type        = string
}

variable "region" {
  description = "Region in AWS"
  type = string
  
}