# Task 3: Infrastructure as Code (IaC) with Terraform

## Objective
Provision a Docker container locally using Terraform.

---

## Tools Used
- **Terraform**: For Infrastructure as Code
- **Docker**: To run containerized applications
- **AWS EC2**: Host environment (Amazon Linux 2023)
- **GitHub**: Source control
- **Jenkins**: Optional CI/CD integration

---

## Prerequisites
1. EC2 instance with Amazon Linux 2023
2. Terraform installed
3. Docker installed and running
4. GitHub repository created
5. Docker Hub account with your image pushed (example: `vishakhagujar/firstdockerproject:v1`)

---

## Step 1: Configure EC2
```bash
# Connect to EC2
ssh -i path/to/key.pem ec2-user@<EC2_PUBLIC_IP>
```

## Set hostname
sudo hostnamectl set-hostname terraform1

## Install Terraform

- sudo dnf install -y dnf-plugins-core
- sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
- sudo dnf -y install terraform

## Install Docker

- sudo dnf install -y docker
- sudo systemctl start docker
- sudo systemctl enable docker
- sudo usermod -aG docker ec2-user
- exit

---

## Step 2: Terraform Configuration (main.tf)

- Provider: Docker
- Pull custom Docker image from Docker Hub
- Create container and map ports

---

## Step 3: Terraform Commands

Initialize Terraform 
```bash
terraform init
```

Validate Terraform code
```bash
terraform validate
```

Plan before applying
```bash
terraform plan
```

Apply to create resources
```bash
terraform apply
```

Check Terraform state
```bash
terraform state list
```

Destroy resources
```bash
terraform destroy
```
---

## Step 4: Verify Docker Container
```bash
docker ps
docker logs <container name>
```

Access the Application
- Open your browser and go to:
http://your-ec2-public-ip:8080

---

## Important Files

- main.tf → Terraform configuration to pull Docker image and run container.
  
- .terraform.lock.hcl → Terraform dependency lock file.
```bash
cat .terraform.lock.hcl
```
Note: .terraform.lock.hcl ensures consistent provider versions across environments. You should commit it to GitHub for reproducibility.

