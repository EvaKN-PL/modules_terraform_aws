output "dns_name" {
    description = "The public DNS name of the Load Balancer"
    value = aws_lb.main.dns_name
  
}