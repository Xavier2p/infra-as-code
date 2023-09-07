resource "docker_image" "adguard-exporter" {
  name = "ebrianne/adguard-exporter:latest"
}

resource "docker_container" "adguard-exporter" {
  name    = "adguard-exporter"
  image   = docker_image.adguard-exporter.name
  restart = "unless-stopped"

  env = [
    "adguard_protocol=http",
    "adguard_hostname=adguard-home",
    "adguard_username=api",
    "adguard_password=${var.adguard_api_password}",
    "interval=10s",
    "log_limit=10000",
    "server_port=9617"
  ]

  networks_advanced {
    name = var.hostname
  }

  depends_on = [
    docker_image.adguard-exporter
  ]
}
