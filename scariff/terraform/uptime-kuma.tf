resource "docker_image" "uptime_kuma" {
  name = "louislam/uptime-kuma:latest"
}

resource "docker_container" "uptime_kuma" {
  name    = "uptime-kuma"
  image   = docker_image.uptime_kuma.name
  restart = "always"

  ports {
    internal = 3001
    external = 4040
  }

  volumes {
    container_path = "/app/data"
    host_path      = "/docker/uptime-kuma/"
  }

  labels {
    label = "traefik.http.services.uptimekuma.loadBalancer.server.port"
    value = "3001"
  }
  labels {
    label = "traefik.http.routers.uptimekuma.rule"
    value = "Host(`status.rpi.srv`)"
  }
  labels {
    label = "traefik.http.routers.uptimekuma.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.uptime_kuma,
    docker_network.scariff
  ]
}

# labels {
# label = "traefik.http.routers.uptimekuma.tls.certresolver"
# value = "le"
# }
# labels {
#   label = "traefik.http.routers.uptimekuma.tls"
#   value = "true"
# }
