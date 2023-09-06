resource "docker_image" "adguard" {
  name = "adguard/adguardhome"
}

resource "docker_container" "adguard" {
  name    = "adguard-home"
  image   = docker_image.adguard.name
  restart = "unless-stopped"

  ports {
    internal = 53
    external = 53
  }
  ports {
    internal = 53
    external = 53
    protocol = "udp"
  }

  volumes {
    container_path = "/opt/adguardhome/conf"
    host_path      = "${var.path_config}/adguard/config"
    read_only      = false
  }
  volumes {
    container_path = "/opt/adguardhome/work"
    host_path      = "${var.path_config}/adguard/work"
    read_only      = false
  }

  labels {
    label = "traefik.http.routers.adguard.rule"
    value = "Host(`dns.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.adguard.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.http.services.adguard.loadbalancer.server.port"
    value = "80"
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.adguard.tls"
    value = var.tls_enable
  }
  labels {
    label = "traefik.http.routers.adguard.tls.certresolver"
    value = var.resolver_ssl
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.adguard,
    docker_network.main
  ]
}
