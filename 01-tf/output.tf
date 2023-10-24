output "wordpress_aws_elastic_ip" {
  value       = "http://${aws_eip.wordpress_eip.public_ip}:${var.wordpress_port}"
  description = "Public IP address of the wordpress instance. Access with the HTTP protocol. Example: http://44.206.118.193:8080"
}
