terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull image depuis Docker Hub
resource "docker_image" "cvonepage" {
  name = "votreutilisateur/cvonepage:latest"
  keep_locally = false
}

# Déploiement du conteneur
resource "docker_container" "moncv" {
  name  = "moncv"
  image = docker_image.cvonepage.latest
  ports {
    internal = 80
    external = 8585
  }
}
