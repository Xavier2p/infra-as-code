resource "docker_image" "radarr" {
  name = "linuxserver/radarr:latest"
}

resource "docker_container" "radarr" {
  name    = "radarr"
  image   = docker_image.radarr.name
  restart = "unless-stopped"

  env = [
    "TZ=Europe/Paris",
    "PUID=1000",
    "PGID=1000",
  ]

  volumes {
    host_path      = "${var.path_config}/radarr"
    container_path = "/config"
  }
  volumes {
    host_path      = "${var.path_downloads}/movies"
    container_path = "/movies"
  }
  # volumes {
  #     host_path      = "${var.path_downloads}/downloads"
  #     container_path = "/downloads"
  # }

  labels {
    label = "traefik.http.services.radarr.loadbalancer.server.port"
    value = "7878"
  }
  labels {
    label = "traefik.http.routers.radarr.rule"
    value = "Host(`radarr.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.radarr.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.radarr.tls.certresolver"
    value = var.resolver_ssl
  }

  labels {
    label = "traefik.http.routers.radarr.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.radarr,
  ]
}
