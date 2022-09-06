output "ip_address" {
  value = {
    for instance in aws_instance.web:
    instance.id => instance.private_ip
  }
}