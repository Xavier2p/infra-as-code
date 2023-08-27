resource "docker_image" "me-tube" {
  name = "ghcr.io/alexta69/metube:latest"
}

resource "docker_container" "me-tube" {
  name    = "me-tube"
  image   = docker_image.me-tube.name
  restart = "unless-stopped"

  env = [
    "DARK_MODE=true"
  ]

  ports {
    internal = 8081
    external = 8081
  }

  volumes {
    container_path = "/downloads"
    host_path      = "/downloads/ytdl"
  }

  labels {
    label = "traefik.http.routers.me-tube.rule"
    value = "Host(`ytld.${var.domain_name}`)"
  }

  labels {
    label = "traefik.http.routers.me-tube.entrypoints"
    value = "web"
  }

  labels {
    label = "traefik.http.services.me-tube.loadbalancer.server.port"
    value = "8081"
  }

  labels {
    label = "traefik.enable"
    value = "true"
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.me-tube,
    docker_network.main
  ]
}
