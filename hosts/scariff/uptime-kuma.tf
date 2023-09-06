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
    host_path      = "${var.path_config}/uptime-kuma/"
    read_only      = false
  }
  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }

  labels {
    label = "traefik.http.services.uptimekuma.loadbalancer.server.port"
    value = "3001"
  }
  labels {
    label = "traefik.http.routers.uptimekuma.rule"
    value = "Host(`status.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.uptimekuma.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.uptimekuma.tls.certresolver"
    value = var.resolver_ssl
  }

  labels {
    label = "traefik.http.routers.uptimekuma.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.uptime_kuma,
    docker_network.main
  ]
}
