esource "docker_image" "traefik" {
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

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }
  volumes {
    container_path = "/etc/traefik"
    host_path      = "${var.path_config}/traefik/"
    read_only      = false
  }

  labels {
    label = "traefik.http.routers.rpm.rule"
    value = "Host(`proxy.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.rpm.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.rpm.loadbalancer.server.port"
    value = "8080"
  }
  labels {
    label = "traefik.http.routers.rpm.tls.certresolver"
    value = var.resolver_ssl
  }

  labels {
    label = "traefik.http.routers.rpm.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.traefik,
    docker_network.main
  ]
}
