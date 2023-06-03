terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.13.0"
    }
  }
}

provider "docker" {
  # can be the port in remote connection
  host = "unix:///var/run/docker.sock"
}
