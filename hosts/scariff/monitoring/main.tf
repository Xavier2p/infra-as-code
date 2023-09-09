terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

# provider "docker" {
#   # can be the port in remote connection
#   host = "unix:///var/run/docker.sock"
#   # host = "tcp://${var.host}:2375"
# }
