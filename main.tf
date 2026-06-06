provider "aws" {
  region = var.aws_region
}

# Default VPC
data "aws_vpc" "default" {
    default = true
}

# Default Subnets
data "aws_subnets" "default" {
    filter {
      name = "vpc-id"
      values = [data.aws_vpc.default]
    }
}

# Ubuntu 20.04 LTS AMI

data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # Canonical
    filter {
        name = "Amiya-B14-skill3"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

# Security Group

resource "aws_security_group" "amiya_nginx_sg" {
    name = var.security_group_name
    description = "Allow SSH and HTTP traffic"
    vpc_id = data.aws_vpc.default.id
    ingress {
        description = "HTTP"
        from_port = var.http_port
        to_port = var.http_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.security_group_name
    }

}

# EC2 Instance
resource "aws_instance" "nginx_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    subnet_id = data.aws_subnets.default.ids[0]
    security_groups = [aws_security_group.amiya_nginx_sg.id]
    user_data = file("${path.module}/user_data.sh")
    tags = {
        Name = var.instance_name
    }
}