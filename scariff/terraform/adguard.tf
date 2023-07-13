resource "docker_image" "adguard" {
  name = "adguard/adguardhome"
}

resource "docker_container" "adguard" {
  name    = "adguard-home"
  image   = docker_image.adguard.name
  restart = "unless-stopped"

  ports {
    internal = 53
    external = 53
  }
  ports {
    internal = 53
    external = 53
    protocol = "udp"
  }
  ports {
    internal = 80
    external = 1010
  }

  volumes {
    container_path = "/opt/adguardhome/conf"
    host_path      = "/docker/adguard/config"
  }
  volumes {
    container_path = "/opt/adguardhome/work"
    host_path      = "/docker/adguard/work"
  }

  labels {
    label = "traefik.http.routers.adguard.rule"
    value = "Host(`dns.rpi.srv`)"
  }
  labels {
    label = "traefik.http.routers.adguard.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.http.services.adguard.loadbalancer.server.port"
    value = "80"
  }
  labels {
    label = "traefik.enable"
    value = "true"
  }

  networks_advanced {
    name = "scariff"
  }

  depends_on = [
    docker_image.adguard,
    docker_network.scariff
  ]
}
