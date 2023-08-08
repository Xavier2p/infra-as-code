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
    host_path      = "/usr/local/mariadb"
    read_only      = false
  }

  networks_advanced {
    name = "exegol"
  }

  depends_on = [
    docker_container.mariadb,
    docker_network.exegol
  ]
}
