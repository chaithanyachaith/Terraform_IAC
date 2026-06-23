# AWS Production Infrastructure with Terraform

## 📖 Overview

This project demonstrates how to build a production-style AWS infrastructure using Terraform and reusable modules. The infrastructure follows high availability best practices by deploying resources across two Availability Zones.

The project is designed to simulate how infrastructure is provisioned in real-world production environments using Infrastructure as Code (IaC).

---

## 🏗️ Architecture

```
                    Internet
                        │
                        ▼
                Internet Gateway
                        │
                        ▼
          Application Load Balancer (ALB)
         (Public Subnet 1 & Public Subnet 2)
                        │
                 HTTP Listener (Port 80)
                        │
                        ▼
                  Target Group
                        │
                 Auto Scaling Group
                        │
          ┌─────────────┴─────────────┐
          ▼                           ▼
   EC2 Instance                  EC2 Instance
  (Private Subnet 1)           (Private Subnet 2)
          │                           │
          └─────────────┬─────────────┘
                        │
                 NAT Gateway
                        │
                 Internet Gateway
```

---

## 📂 Project Structure

```
terraform-demo/
│
├── modules/
│   ├── VPC/
│   ├── subnets/
│   ├── igw/
│   ├── public_route_table/
│   ├── elastic_ip/
│   ├── nat_gateway/
│   ├── private_route_table/
│   ├── security_groups/
│   ├── alb/
│   ├── target_group/
│   ├── listener/
│   ├── launch_template/
│   └── auto_scaling/
│
├── backend.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── main.tf
```

---

## 🚀 AWS Services Used

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables
- Elastic IP
- NAT Gateway
- Security Groups
- Application Load Balancer (ALB)
- Target Group
- Listener
- Launch Template
- Auto Scaling Group
- Amazon EC2
- Amazon S3 (Terraform State)

---

## ⚙️ Features

- Modular Terraform project structure
- Multi-AZ deployment
- Public and Private subnet architecture
- Internet access through Internet Gateway
- Outbound internet access for private instances through NAT Gateway
- Application Load Balancer for traffic distribution
- Auto Scaling Group for high availability
- Launch Template for standardized EC2 deployments
- Reusable Terraform modules

---

## 📚 Concepts Learned

During this project I gained hands-on experience with:

- Terraform Modules
- Variables and Outputs
- Resource Dependencies
- VPC Networking
- Public vs Private Subnets
- Route Tables
- Internet Gateway
- NAT Gateway
- Security Groups
- Load Balancing
- Target Groups
- Listeners
- Launch Templates
- Auto Scaling Groups
- High Availability Architecture

---

## 🛠️ How to Deploy

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

To destroy the infrastructure:

```bash
terraform destroy
```

---

## 📈 Future Enhancements

Planned additions include:

- Amazon RDS
- IAM Roles & Instance Profiles
- CloudWatch Monitoring & Alarms
- ACM SSL Certificate
- HTTPS Listener (443)
- Route 53
- AWS WAF
- Bastion Host / AWS Systems Manager
- CI/CD Pipeline using GitHub Actions
- Remote Terraform State Locking with DynamoDB

---

## 🎯 Goal

The objective of this project is to gain practical experience in building scalable, highly available, and production-ready AWS infrastructure using Terraform while following Infrastructure as Code (IaC) best practices.

---

## 👨‍💻 Author

**Chaithanya**

Learning Terraform | AWS | DevOps | Infrastructure as Code
