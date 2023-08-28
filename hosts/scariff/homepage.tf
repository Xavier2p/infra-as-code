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
    container_path = "/app/config"
    host_path      = "${var.path_config}/homepage/"
    read_only      = false
  }
  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }

  labels {
    label = "traefik.http.services.homepage.loadbalancer.server.port"
    value = "3000"
  }
  labels {
    label = "traefik.http.routers.homepage.rule"
    value = "Host(`admin.${var.domain_name}`)"
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
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.homepage,
    docker_network.main
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
