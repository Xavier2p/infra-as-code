resource "docker_image" "portainer_agent" {
  name = "portainer/agent:latest"
}

resource "docker_container" "portainer_agent" {
  name    = "portainer-agent"
  image   = docker_image.portainer_agent.name
  restart = "always"

  ports {
    internal = 9001
    external = 9001
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = false
  }
  volumes {
    container_path = "/var/lib/docker/volumes"
    host_path      = "/var/lib/docker/volumes"
    read_only      = false
  }

  networks_advanced {
    name = var.network.name
  }

  depends_on = [
    docker_image.portainer_agent
  ]
}
