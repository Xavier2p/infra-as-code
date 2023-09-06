resource "docker_image" "homepage" {
  name = "ghcr.io/benphelps/homepage:latest"
}

resource "docker_container" "homepage" {
  name    = "homepage"
  image   = docker_image.homepage.name
  restart = "always"

  env = [
    "HOMEPAGE_VAR_CLOUDFLARE_TUNNEL_ID=${var.cloudflare_tunnel_id}",
    "HOMEPAGE_VAR_CLOUDFLARE_USER_ID=${var.cloudflare_user_id}",
    "HOMEPAGE_VAR_CLOUDFLARE_API_TOKEN=${var.cloudflare_api_token}",
    "HOMEPAGE_VAR_ADGUARD_API_PASSWORD=${var.adguard_api_password}",
  ]

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
    value = var.entrypoint
  }
  labels {
    label = "traefik.enable"
    value = var.traefik_enable
  }
  labels {
    label = "traefik.http.routers.homepage.tls.certresolver"
    value = var.resolver_ssl
  }

  labels {
    label = "traefik.http.routers.homepage.tls"
    value = var.tls_enable
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
