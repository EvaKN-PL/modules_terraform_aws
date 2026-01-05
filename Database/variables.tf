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
variable "region" {
    description = "Region in AWS"
    type = string
  
}

variable "env" {
    description = "Name of environment"
    type = string
}