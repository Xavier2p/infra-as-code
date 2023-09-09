module "database" {
  source = "./databases"

  providers = {
    docker = docker
  }

  password_mariadb   = var.password_mariadb
  password_surrealdb = var.password_surrealdb
  storage_mariadb    = var.storage_mariadb
  storage_surrealdb  = var.storage_surrealdb
  user_surrealdb     = var.user_surrealdb
  network            = docker_network.main.name
}
