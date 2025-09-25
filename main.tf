# main.tf - Terraform configuration to run a Docker container


# Specify Terraform provider requirements
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"   # Docker provider source
      version = "~> 3.0.2"             # Version constraint
    }
  }
}


# Configure the Docker provider (connects to local Docker daemon)
provider "docker" {}


# Pull the custom Docker image from Docker Hub
resource "docker_image" "my_app_image" {
  name = "vishakhagujar/firstdockerproject:v1"  #  Docker image
}


# Create a container from the pulled image
resource "docker_container" "my_app_container" {
  name  = "terraform-firstdocker"         # Container name
  image = docker_image.my_app_image.name  # Use the pulled image directly

  # Map container port to host port
  ports {
    internal = 80        # Port inside the container
    external = 8080      # Port exposed on the host
  }
}



# End of main.tf
