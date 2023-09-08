resource "docker_image" "jellyfin" {
  name = "jellyfin/jellyfin:latest"
}

resource "docker_container" "jellyfin" {
  name         = "jellyfin"
  image        = docker_image.jellyfin.name
  restart      = "unless-stopped"
  network_mode = "host"

  volumes {
    host_path      = "${var.path_config}/jellyfin"
    container_path = "/config"
  }

  volumes {
    host_path      = "${var.path_downloads}/movies"
    container_path = "/movies"
  }
  volumes {
    host_path      = "${var.path_downloads}/series"
    container_path = "/series"
  }
  volumes {
    host_path      = "${var.path_downloads}/music"
    container_path = "/music"
  }
  volumes {
    host_path      = "${var.path_downloads}/photos"
    container_path = "/photos"
  }
  volumes {
    host_path      = "${var.path_downloads}/ytdl"
    container_path = "/ytdl"
  }

  labels {
    label = "traefik.http.services.jellyfin.loadbalancer.server.port"
    value = "8096"
  }
  labels {
    label = "traefik.http.routers.jellyfin.rule"
    value = "Host(`jellyfin.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.jellyfin.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.jellyfin.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.jellyfin.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.hostname
  }

  depends_on = [
    docker_image.jellyfin
  ]
}
