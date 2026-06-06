output "instance_public_ip" {
  description = "Public IP Address of EC2 Instance"
  value       = aws_instance.nginx_server.public_ip
}

output "application_url" {
  description = "Nginx URL"
  value       = "http://${aws_instance.nginx_server.public_ip}"
}