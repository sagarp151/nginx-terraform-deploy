# NGINX Terraform Deployment on AWS

This project uses Terraform to provision infrastructure for a basic NGINX web service hosted on AWS. The service is publicly accessible over HTTP and deployed using ECS Fargate.

---

## How to Deploy
These are the steps required to deploy the infrastructure.

1. Make sure the following tools are installed:
Terraform
AWS CLI
Git

2. Clone the repository:
git clone https://github.com/sagarp151/nginx-terraform-deploy.git
cd nginx-terraform-deploy

3. Initialize the Terraform project:
terraform init

4. Run a plan to preview changes:
terraform plan

5. Apply the infrastructure (only if you have AWS access set up):
terraform apply
This will provision the VPC, subnets, load balancer, ECS cluster, and Fargate service running NGINX.


## Approach and Rationale
I chose ECS Fargate for this setup because it allows for container deployment without needing to manage EC2 instances. It also integrates well with Terraform and supports automatic scaling.

The NGINX service runs using the official nginx:alpine Docker image, which is lightweight and well-suited for simple HTTP workloads.

A public Application Load Balancer is used to make the service accessible over the internet on port 80. Security groups are used to restrict access and allow only the necessary HTTP traffic.

## Assumptions
The assignment specifies that the company already has Terraform Cloud or an S3 backend configured for state management. Based on this, I did not include a backend configuration block in the Terraform code. In a real-world environment, that setup would be handled separately and securely, often through CI/CD pipelines or workspace variables.

It’s also assumed that credentials for AWS access would be set via environment variables or AWS CLI configuration and not hardcoded into the project.


## Areas for improvement
Adding HTTPS support using ACM certificates and an HTTPS listener on the load balancer
Including health checks and auto-scaling rules for the ECS service
Adding logging and monitoring with CloudWatch
Introducing private subnets for better network isolation
Making the infrastructure more modular and reusable across multiple environments (e.g., dev, staging, production)

