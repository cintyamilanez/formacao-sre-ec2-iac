output "prometheus_node_exporter_aws_elastic_ip" {
  value       = "http://${aws_eip.wordpress_eip.public_ip}:${var.wordpress_port}"
  description = "Public IP address of the prometheus node_exporter port. Access with the HTTP protocol. Example: http://44.206.118.193:9100"
}

output "wordpress_aws_elastic_telemetry_path" {
  value       = "http://${aws_eip.wordpress_eip.public_ip}:${var.prometheus_node_exporter_port}/${var.prometheus_node_exporter_telemetry_path}"
  description = "Public telemetry path address of the wordpress instance. Access with the HTTP protocol. Example: http://44.206.118.193:8080"
}
