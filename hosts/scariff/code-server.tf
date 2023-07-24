resource "docker_image" "code_server" {
  name = "linuxserver/code-server:latest"
}

resource "docker_container" "code_server" {
  name    = "code-server"
  image   = docker_image.code_server.name
  restart = "unless-stopped"
  env = [
    "PGID=1000",
    "PUID=1000"
  ]

  ports {
    internal = 8443
    external = 8443
  }

  volumes {
    container_path = "/config"
    host_path      = "/docker/code-server/"
  }
  volumes {
    container_path = "/docker-config"
    host_path      = "/docker"
  }

  labels {
    label = "traefik.http.routers.code-server.rule"
    value = "Host(`code.${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.code-server.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }
  labels {
    label = "traefik.http.services.code-server.loadbalancer.server.port"
    value = "8443"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.code_server,
    docker_network.scariff
  ]
}

# labels {
#   label = "traefik.http.routers.code-server.tls.certresolver"
#   value = "le"
# }
# labels {
#   label = "traefik.http.routers.code-server.tls"
#   value = "true"
# }
