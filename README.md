# Terraform Nginx EC2 on Ubuntu

This repository provisions a single Ubuntu EC2 instance with Nginx using Terraform.

**What it creates:**
- An AWS EC2 `t2.micro` instance running Ubuntu
- A security group allowing HTTP (80) and SSH (22)
- Nginx installed and a simple index page populated via `user_data`
- Outputs the instance public IP

This configuration uses your account's default VPC and subnets; it does not create a VPC, subnet, or internet gateway.

**Prerequisites:**
- Terraform 1.0+ installed
- AWS CLI configured with credentials (or environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`)

**Files of interest:**
- `main.tf` — Terraform resources
- `variables.tf` — Input variables and defaults
- `terraform.tfvars` — (optional) local variable overrides
- `userdata.sh` — script run on first boot to install Nginx and customize the index
- `output.tf` — outputs (public IP)

**Quick usage:**

```bash
terraform init
terraform plan
terraform apply
```

To destroy the created resources:

```bash
terraform destroy
```

**Common variable overrides:**
- Specify an AWS region:

```bash
terraform apply -var="aws_region=ap-south-1"
```

- Restrict SSH to a specific IP (replace `YOUR_PUBLIC_IP`):

```bash
terraform apply -var="ssh_cidr=YOUR_PUBLIC_IP/32"
```

