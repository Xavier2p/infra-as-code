resource "docker_image" "homer" {
  name = "b4bz/homer:latest"
}


resource "docker_container" "homer" {
  name    = "homer"
  image   = docker_image.homer.name
  restart = "unless-stopped"

  ports {
    internal = 8080
    external = 8902
  }

  volumes {
    container_path = "/www/assets"
    host_path      = "/docker/homer"
  }

  labels {
    label = "traefik.http.routers.homer.rule"
    value = "Host(`public.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.homer.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }
  labels {
    label = "traefik.http.services.homer.loadbalancer.server.port"
    value = "8080"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.homer,
    docker_network.scariff
  ]
}
