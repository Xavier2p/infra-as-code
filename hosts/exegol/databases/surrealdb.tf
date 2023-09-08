resource "docker_image" "surrealdb" {
  name = "surrealdb/surrealdb:1.0.0-beta.9-20230402"
}

resource "docker_container" "surrealdb" {
  name    = "surrealdb"
  image   = docker_image.surrealdb.name
  restart = "always"
  entrypoint = [
    "/surreal",
    "start",
    "--user",
    var.user_surrealdb,
    "--pass",
    var.password_surrealdb,
    "file:${var.storage_surrealdb}/database.db"
  ]

  ports {
    internal = 8000
    external = 3307
  }

  volumes {
    host_path      = "/usr/local/surrealdb"
    container_path = var.storage_surrealdb
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.surrealdb
  ]
}
