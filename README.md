# HUG Lagos/Ibadan Terraform Challenge - Week One

## Deploying a Basic Web Server on AWS Using Terraform

## Project Overview

<img width="1280" height="759" alt="HUG_website" src="https://github.com/user-attachments/assets/f7bacf78-f3a3-40ca-8275-1e01b8b6b6a8" />

This project was completed as part of the **HUG Lagos/Ibadan Terraform Challenge Week One**.

The objective was to provision a simple web server on AWS using **Terraform Infrastructure as Code (IaC)**.

Instead of manually creating resources through the AWS Console, Terraform was used to automate the deployment of cloud infrastructure.

---

# Architecture Overview

The infrastructure deployed using Terraform includes:

* Custom AWS VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Instance
* Nginx Web Server

Architecture flow:

<img width="1080" height="592" alt="HUG_architecture-diagram" src="https://github.com/user-attachments/assets/2e84e021-96c6-43e9-bf77-2396c7c10c9b" />

---

# AWS Services Used

| AWS Service      | Purpose                                    |
| ---------------- | ------------------------------------------ |
| Amazon VPC       | Created an isolated networking environment |
| Public Subnet    | Hosted the public-facing EC2 instance      |
| Internet Gateway | Enabled internet connectivity              |
| Route Table      | Managed network traffic routing            |
| Security Group   | Controlled inbound and outbound traffic    |
| Amazon EC2       | Provided compute resources                 |
| Nginx            | Served the website content                 |

---

# Terraform Concepts Practised

This project helped me develop practical experience with:

* Terraform provider configuration
* Terraform resources
* Data sources
* Infrastructure as Code principles
* Resource dependencies
* Variables and outputs
* EC2 provisioning
* User data scripts
* Terraform workflow:

  * `terraform init`
  * `terraform validate`
  * `terraform plan`
  * `terraform apply`
  * `terraform destroy`

---

# Project Structure

```
hug-terraform-week1/

├── main.tf          # AWS resource configuration
├── provider.tf      # AWS provider configuration
├── data.tf          # AWS AMI data source
├── userdata.sh      # EC2 bootstrap script
├── outputs.tf       # Terraform output values
├── .gitignore       # Excludes Terraform generated files
└── README.md
```

---

# Implementation Journey (Step-by-Step)

## Step 1: Setting Up the Environment

I prepared my local development environment by installing and configuring:

* Terraform
* AWS CLI
* Visual Studio Code
* Git

Verified Terraform installation:

```bash
terraform version
```

Configured AWS CLI:

```bash
aws configure
```

Verified AWS authentication:

```bash
aws sts get-caller-identity
```

This confirmed that Terraform could communicate with my AWS account.

---

## Step 2: Creating the Terraform Project

Created the project directory:

```bash
mkdir hug-terraform-week1

cd hug-terraform-week1
```

Created Terraform configuration files:

```
main.tf
provider.tf
data.tf
outputs.tf
userdata.sh
README.md
```

---

## Step 3: Configuring Terraform and AWS Provider

Initialised Terraform:

```bash
terraform init
```

This downloaded the AWS provider plugin required to manage AWS resources.

---

## Step 4: Creating Network Infrastructure

Using Terraform resources, I created:

### Custom VPC

Created an isolated AWS network:

```hcl
resource "aws_vpc" "hug_vpc"
```

CIDR block:

```
10.0.0.0/16
```

---

### Public Subnet

Created a public subnet:

```hcl
resource "aws_subnet" "public_subnet"
```

Configured:

* CIDR block
* Availability Zone
* Public IP assignment

---

### Internet Gateway

Created an Internet Gateway to allow communication between the VPC and the internet.

---

### Route Table

Created routing rules to direct internet traffic through the Internet Gateway.

---

## Step 5: Creating Security Controls

Created a Security Group allowing:

| Traffic | Port | Purpose               |
| ------- | ---- | --------------------- |
| SSH     | 22   | Remote administration |
| HTTP    | 80   | Web access            |

---

## Step 6: Provisioning the EC2 Instance
<img width="1279" height="757" alt="HUG_EC2" src="https://github.com/user-attachments/assets/f472fa8e-baed-4f60-b9ca-2101390954fe" />

Created an Amazon EC2 instance using Terraform.

Configured:

* Amazon Linux AMI
* t3.micro instance type
* Public subnet placement
* Security group attachment

Terraform automatically managed resource dependencies:

```
VPC
 ↓
Subnet
 ↓
Security Group
 ↓
EC2 Instance
```

---

## Step 7: Automating Server Configuration Using User Data

The EC2 instance was configured using a Terraform `user_data` script.

The script automatically:

1. Updated system packages
2. Installed Nginx
3. Started the Nginx service
4. Created a custom HTML webpage

Example:

```bash
yum install nginx -y

systemctl start nginx
```

This allowed the web server to be configured automatically during instance launch.

---

## Step 8: Validating Terraform Configuration

Checked the Terraform configuration:

```bash
terraform validate
```

Successful validation confirmed that the configuration was correct.

---

## Step 9: Reviewing the Deployment Plan

Reviewed the infrastructure changes:

```bash
terraform plan
```

This allowed me to confirm the resources Terraform would create before deployment.

---

## Step 10: Deploying Infrastructure

Provisioned AWS resources:

```bash
terraform apply
```

Terraform successfully created:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Security Group
* EC2 Instance

---

## Step 11: Accessing the Website

Retrieved the website URL using Terraform outputs:

```bash
terraform output
```

The webpage was accessed through the EC2 public IP address.

---

## Step 12: Version Control and GitHub Deployment

Created a `.gitignore` file to exclude Terraform generated files:

```
.terraform/
*.tfstate
*.tfstate.*
```

Committed the project:

```bash
git add .

git commit -m "Deploy AWS web server using Terraform"
```

Pushed the project to GitHub:

```bash
git push
```

---

# Deployment Instructions

## Prerequisites

Ensure you have:

* AWS Account
* AWS CLI configured
* Terraform installed
* Git installed

---

## Clone Repository

```bash
git clone https://github.com/MabelOmolaja/hug-terraform-week1.git

cd hug-terraform-week1
```

---

## Initialise Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Review Plan

```bash
terraform plan
```

---

## Deploy

```bash
terraform apply
```

Confirm with:

```
yes
```

---

## Destroy Resources

To remove resources and avoid unnecessary AWS charges:

```bash
terraform destroy
```

---

# Challenges and Lessons Learned

During this project, I encountered and solved several challenges:

* Configuring AWS CLI authentication
* Understanding Terraform workflow and state management
* Debugging Terraform syntax errors
* Resolving AWS EC2 Free Tier instance compatibility issues
* Understanding how user data works during EC2 provisioning
* Managing Terraform generated files with Git
* Removing accidentally committed Terraform provider files from Git history

These challenges improved my understanding of cloud infrastructure management, Infrastructure as Code, and DevOps best practices.

---

# Final Outcome

Successfully deployed a basic web server on AWS using Terraform.

This project demonstrates how cloud infrastructure can be provisioned, configured, and managed using Infrastructure as Code rather than manual configuration.

---

# Author

**Mabel Omolaja | Cloud Engineer**


