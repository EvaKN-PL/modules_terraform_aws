output "dns_name" {
    description = "Link to ALB"
    value = aws_lb.main.dns_name
  
}