variable "password_mariadb" {}

variable "user_surrealdb" {}

variable "password_surrealdb" {}

variable "storage_surrealdb" {}

variable "storage_mariadb" {}

variable "network" {
  type        = string
  description = "Docker network name"
}
