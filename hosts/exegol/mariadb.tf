resource "docker_image" "mariadb" {
  name = "mariadb:latest"
}

resource "docker_container" "mariadb" {
  name    = "mariadb"
  image   = docker_image.mariadb.name
  restart = "always"

  env = [
    "PGID=50",
    "PUID=1000",
    "MYSQL_ROOT_PASSWORD=${var.password_mariadb}"
  ]

  ports {
    internal = 3306
    external = 3306
  }

  volumes {
    container_path = "/var/lib/mysql"
    host_path      = var.storage_mariadb
    read_only      = false
  }

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_container.mariadb,
    docker_network.main
  ]
}
