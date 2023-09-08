terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # can be the port in remote connection
  host = "unix:///var/run/docker.sock"
}

module "database" {
  source = "./databases"

  password_mariadb   = var.password_mariadb
  password_surrealdb = var.password_surrealdb
  storage_mariadb    = var.storage_mariadb
  storage_surrealdb  = var.storage_surrealdb
  user_surrealdb     = var.user_surrealdb
  network            = docker_network.main.name
}
