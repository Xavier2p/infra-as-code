resource "docker_image" "homepage" {
  name = "ghcr.io/benphelps/homepage:latest"
}

resource "docker_container" "homepage" {
  name    = "homepage"
  image   = docker_image.homepage.name
  restart = "always"

  ports {
    internal = 3000
    external = 3015
  }

  volumes {
    container_path = "/app/data"
    host_path      = "/docker/homepage/"
  }

  labels {
    label = "traefik.http.services.homepage.loadBalancer.server.port"
    value = "3000"
  }
  labels {
    label = "traefik.http.routers.homepage.rule"
    value = "Host(`admin.rpi.srv`)"
  }
  labels {
    label = "traefik.http.routers.homepage.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.homepage,
    docker_network.scariff
  ]
}

#   labels {
#     label = "traefik.http.routers.homepage.tls.certresolver"
#     value = "le"
#   }
#   labels {
#     label = "traefik.http.routers.homepage.tls"
#     value = "true"
#   }
