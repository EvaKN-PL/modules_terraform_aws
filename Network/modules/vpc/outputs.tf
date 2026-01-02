output "vpc_id" {
    description = "ID of VPC"
    value = aws_vpc.main.id
  
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}