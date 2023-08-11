resource "docker_image" "grafana" {
  name = "grafana/grafana-oss:latest"
}

resource "docker_volume" "grafana" {
  name = "grafana"
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
    volume_name    = docker_volume.grafana.name
    read_only      = false
  }

  networks_advanced {
    name = docker_network.exegol.name
  }

  depends_on = [
    docker_container.grafana,
    docker_volume.grafana,
    docker_network.exegol
  ]
}
