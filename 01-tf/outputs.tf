output "prometheus_aws_elastic_ip" {
  value       = "http://${aws_eip.wordpress_eip.public_ip}:${var.prometheus_port}"
  description = "Public IP address of the prometheus port. Access with the HTTP protocol. Example: http://44.206.118.193:9090"
}

output "wordpress_aws_elastic_ip" {
  value       = "http://${aws_eip.wordpress_eip.public_ip}:${var.wordpress_port}"
  description = "Public IP and PORT of the wordpress instance. Access with the HTTP protocol. Example: http://44.206.118.193:80"
}
