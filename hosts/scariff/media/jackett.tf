resource "docker_image" "jackett" {
  name = "linuxserver/jackett:latest"
}

resource "docker_container" "jackett" {
  name    = "jackett"
  image   = docker_image.jackett.name
  restart = "unless-stopped"

  env = [
    "TZ=Europe/Paris",
    "PUID=1000",
    "PGID=1000",
  ]

  volumes {
    host_path      = "${var.path_config}/jackett"
    container_path = "/config"
  }
  #   volumes {
  #     host_path      = "${var.path_downloads}/jackett"
  #     container_path = "/downloads"
  #   }

  labels {
    label = "traefik.http.services.jackett.loadbalancer.server.port"
    value = "9117"
  }
  labels {
    label = "traefik.http.routers.jackett.rule"
    value = "Host(`jackett.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.jackett.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.jackett.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.jackett.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.jackett,
  ]
}
