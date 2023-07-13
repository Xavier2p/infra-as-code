resource "docker_image" "dozzle" {
  name = "amir20/dozzle:latest"
}

resource "docker_container" "dozzle" {
  name    = "dozzle"
  image   = docker_image.dozzle.name
  restart = "always"

  ports {
    internal = 8080
    external = 8888
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }

  labels {
    label = "traefik.http.routers.dozzle.rule"
    value = "Host(`dozzle.rpi.srv`)"
  }
  labels {
    label = "traefik.http.routers.dozzle.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.http.services.dozzle.loadbalancer.server.port"
    value = "8080"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.dozzle,
    docker_network.scariff
  ]
}
