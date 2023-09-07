resource "docker_image" "grafana" {
  name = "grafana/grafana-oss:latest"
}

resource "docker_container" "grafana" {
  name    = "grafana"
  image   = docker_image.grafana.name
  restart = "unless-stopped"
  user    = "0"

  ports {
    internal = 3000
    external = 3000
  }

  volumes {
    container_path = "/var/lib/grafana"
    host_path      = "${var.path_config}/grafana/data"
    read_only      = false
  }

  labels {
    label = "traefik.http.services.grafana.loadbalancer.server.port"
    value = "3000"
  }
  labels {
    label = "traefik.http.routers.grafana.rule"
    value = "Host(`monitoring.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.grafana.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.grafana.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.grafana.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.hostname
  }

  depends_on = [
    docker_image.grafana
  ]
}
