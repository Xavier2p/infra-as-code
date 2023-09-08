resource "docker_image" "jellyseerr" {
  name = "fallenbagel/jellyseerr:latest"
}

resource "docker_container" "jellyseerr" {
  name    = "jellyseerr"
  image   = docker_image.jellyseerr.name
  restart = "unless-stopped"

  env = [
    "LOG_LEVEL=debug",
    "TZ=Europe/Paris",
  ]

  volumes {
    host_path      = "${var.path_config}/jellyseerr"
    container_path = "/config"
  }

  labels {
    label = "traefik.http.services.jellyseerr.loadbalancer.server.port"
    value = "5055"
  }
  labels {
    label = "traefik.http.routers.jellyseerr.rule"
    value = "Host(`vod.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.jellyseerr.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.jellyseerr.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.jellyseerr.tls"
    value = var.tls_enable
  }

  network_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.jellyseerr
  ]
}
