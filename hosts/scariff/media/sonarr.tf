resource "docker_image" "sonarr" {
  name = "linuxserver/sonarr:latest"
}

resource "docker_container" "sonarr" {
  name    = "sonarr"
  image   = docker_image.sonarr.name
  restart = "unless-stopped"

  env = [
    "TZ=Europe/Paris",
    "PUID=1000",
    "PGID=1000",
  ]

  volumes {
    host_path      = "${var.path_config}/sonarr"
    container_path = "/config"
  }
  volumes {
    host_path      = "${var.path_downloads}/series"
    container_path = "/tv"
  }
  # volumes {
  #     host_path      = "${var.path_downloads}/downloads"
  #     container_path = "/downloads"
  # }

  labels {
    label = "traefik.http.services.sonarr.loadbalancer.server.port"
    value = "8989"
  }
  labels {
    label = "traefik.http.routers.sonarr.rule"
    value = "Host(`sonarr.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.sonarr.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.sonarr.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.sonarr.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.sonarr,
  ]
}
