resource "docker_image" "node_exporter" {
  name = "prom/node-exporter:latest"
}

resource "docker_container" "node_exporter" {
  name    = "node-exporter"
  image   = docker_image.node_exporter.name
  restart = "unless-stopped"

  networks_advanced {
    name = var.hostname
  }

  depends_on = [
    docker_image.node_exporter,
  ]
}
