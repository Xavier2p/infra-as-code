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
    "file:/data/database.db"
  ]

  ports {
    internal = 8000
    external = 3307
  }

  volumes {
    host_path      = var.storage_surrealdb
    container_path = "/data"
  }

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.surrealdb
  ]
}
