resource "docker_image" "traefik" {
  name = "traefik:latest"
}

resource "docker_container" "traefik" {
  name    = "traefik"
  image   = docker_image.traefik.name
  restart = "unless-stopped"

  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 443
    external = 443
  }
  ports {
    internal = 8080
    external = 81
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }
  volumes {
    container_path = "/etc/traefik"
    host_path      = "/docker/traefik/"
  }

  labels {
    label = "traefik.http.routers.traefik.rule"
    value = "Host(`proxy.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.traefik.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }
  labels {
    label = "traefik.http.routers.traefik.loadbalancer.server.port"
    value = "8080"
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.traefik,
    docker_network.main
  ]
}

#   labels {
#     label = "traefik.http.routers.traefik.tls.certresolver"
#     value = "le"
#   }
#   labels {
#     label = "traefik.http.routers.traefik.tls"
#     value = "true"
#   }
