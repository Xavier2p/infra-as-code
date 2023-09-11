resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "prometheus" {
  name    = "prometheus"
  image   = docker_image.prometheus.name
  restart = "unless-stopped"

  command = [
    "--config.file=/etc/prometheus/prometheus.yml",
    # "--storage.local.path=/prometheus",
  ]

  volumes {
    container_path = "/etc/prometheus"
    host_path      = "${var.path_config}/prometheus/config"
    read_only      = false
  }
  volumes {
    container_path = "/prometheus"
    host_path      = "${var.path_config}/prometheus/data"
    read_only      = false
  }

  labels {
    label = "traefik.http.services.prometheus.loadbalancer.server.port"
    value = "9090"
  }
  labels {
    label = "traefik.http.routers.prometheus.rule"
    value = "Host(`prometheus.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.prometheus.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.prometheus.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.prometheus.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.prometheus
  ]
}
