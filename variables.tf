variable "aws_region" {
    description = "AWS region where the EC2 instance will be created"
    type        = string
    default     = "us-east-1"
}

variable "instance_type" {
    description = "EC2 instance type for the Nginx server"
    type        = string
    default     = "t2.micro"
}

variable "instance_name" {
    description = "Name tag for the EC2 instance"
    type        = string
    default     = "amiya-b14-nginx-server"
}

variable "security_group_name" {
    description = "Security Group Name"
    type = string
    default = "amiya-b14-nginx-sg"
}

variable "http_port" {
    description = "Port for HTTP traffic"
    type        = number
    default     = 80
}
variable "ssh_port" {
    description = "Port for SSH traffic"
    type        = number
    default     = 22
}