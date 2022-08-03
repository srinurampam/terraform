output "domain-name" {
  value = aws_instance.web.public_dns
}