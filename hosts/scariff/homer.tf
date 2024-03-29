resource "docker_image" "homer" {
  name = "b4bz/homer:latest"
}

resource "docker_container" "homer" {
  name    = "homer"
  image   = docker_image.homer.name
  restart = "unless-stopped"

  volumes {
    container_path = "/www/assets"
    host_path      = "${var.path_config}/homer"
    read_only      = false
  }

  labels {
    label = "traefik.http.routers.homer.rule"
    value = "Host(`public.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.homer.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.services.homer.loadbalancer.server.port"
    value = "8080"
  }
  labels {
    label = "traefik.http.routers.homer.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.homer.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.homer
  ]
}
