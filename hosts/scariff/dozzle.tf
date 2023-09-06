resource "docker_image" "dozzle" {
  name = "amir20/dozzle:latest"
}

resource "docker_container" "dozzle" {
  name    = "dozzle"
  image   = docker_image.dozzle.name
  restart = "always"

  # ports {
  #   internal = 8080
  #   external = 8888
  # }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }

  labels {
    label = "traefik.http.routers.dozzle.rule"
    value = "Host(`dozzle.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.dozzle.entrypoints"
    value = var.entrypoint
  }
  labels {
    label = "traefik.http.services.dozzle.loadbalancer.server.port"
    value = "8080"
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.dozzle.tls.certresolver"
    value = var.resolver_ssl
  }
  labels {
    label = "traefik.http.routers.dozzle.tls"
    value = var.tls_enable
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.dozzle,
    docker_network.main
  ]
}
