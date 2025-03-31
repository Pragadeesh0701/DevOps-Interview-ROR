# DevOps Assignment: Hosting Dockerized Ruby on Rails App with Nginx on AWS using IaC

## Introduction
This assignment demonstrates how to deploy a **Dockerized Ruby on Rails** application with **Nginx** on **AWS** using Infrastructure as Code (**Terraform**). The deployment includes an **ECS Cluster**, **RDS (PostgreSQL)**, **S3 bucket**, **Elastic Load Balancer (ALB)**, and required networking components.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Terraform Deployment](#terraform-deployment)
- [Testing the Deployment](#testing-the-deployment)
- [Submission](#submission)

## Prerequisites
Ensure you have the following tools installed:
- **Git** → [Download](https://git-scm.com/downloads)
- **Docker** → [Download](https://www.docker.com/products/docker-desktop/)
- **AWS CLI** → [Download](https://aws.amazon.com/cli/)
- **Terraform** → [Download](https://developer.hashicorp.com/terraform/downloads)
- **Visual Studio Code** → [Download](https://code.visualstudio.com/)
- **An AWS account** with required permissions

## Project Structure
```
DevOps-Interview-ROR-App/
├── infrastructure/  # Terraform IaC Code
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── outputs.tf
│   ├── README.md
├── docker/  # Docker setup for the application
│   ├── app/
│   │   ├── Dockerfile
│   │   ├── entrypoint.sh
│   ├── nginx/
│   │   ├── default.conf
│   │   ├── Dockerfile
│   ├── docker-compose.yml
```

## Setup Instructions
### 1. Fork & Clone the Repository
1. **Fork** this repository: [DevOps Interview ROR App](https://github.com/mallowtechdev/DevOps-Interview-ROR-App)
2. Clone your forked repository:
   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/DevOps-Interview-ROR-App.git
   cd DevOps-Interview-ROR-App
   ```

### 2. Build & Push Docker Image to AWS ECR
#### Create an AWS ECR Repository
1. Open **AWS Console** → Navigate to **ECR** → Click **Create Repository**.
2. Name it: `ror-app-repo`
3. Ensure it is **private**.

#### Authenticate Docker with AWS ECR
```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com
```

#### Build, Tag, and Push the Image
```sh
cd docker/app

docker build -t ror-app .

docker tag ror-app:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/ror-app-repo:latest

docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/ror-app-repo:latest
```

## Terraform Deployment
### 1. Initialize Terraform
```sh
cd infrastructure
terraform init
```

### 2. Plan the Infrastructure
```sh
terraform plan
```

### 3. Apply the Configuration
```sh
terraform apply --auto-approve
```

### 4. Get the Load Balancer URL
```sh
terraform output lb_endpoint
```

## Testing the Deployment
1. Open the **Load Balancer URL** in a browser.
2. You should see the **Ruby on Rails Application** running with **Nginx**.

## Submission
1. **Push your code** to GitHub:
   ```sh
   git add .
   git commit -m "Added Terraform scripts"
   git push origin main
   ```
2. **Share the GitHub repository** with `mallowtechdev`.
3. **Email HR** at `hr@mallow-tech.com` with:
   - GitHub repository link
   - Branch details (`main`)

## Notes
- Ensure AWS credentials are set up using `aws configure`
- Verify that all services are up and running in AWS
- Provide detailed comments in your Terraform scripts

---

