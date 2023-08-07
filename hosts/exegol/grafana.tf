resource "docker_image" "grafana" {
  name = "grafana/grafana-oss:latest"
}

resource "docker_container" "grafana" {
  name    = "grafana"
  image   = docker_image.grafana.name
  restart = "unless-stopped"
  user    = "0"

  ports {
    internal = 3000
    external = 3123
  }

  volumes {
    container_path = "/var/lib/grafana"
    host_path      = "/usr/local/grafana"
  }

  networks_advanced {
    name = "exegol"
  }

  depends_on = [
    docker_container.grafana,
    docker_network.exegol
  ]
}
