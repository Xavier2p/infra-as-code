// Create a `exegol.tfvars` to store the values of the variables.

variable "password_mariadb" {
  type        = string
  sensitive   = true
  description = "Password for MariaDB"
}

variable "hostname" {
  type        = string
  default     = "exegol"
  description = "Name of the server"
}

variable "user_surrealdb" {
  type        = string
  default     = "root"
  description = "User to connect to SurrealDB"
}

variable "password_surrealdb" {
  type        = string
  sensitive   = true
  description = "Password for SurrealDB"
}

variable "storage_surrealdb" {
  type        = string
  default     = "/data"
  description = "Path of data, in container"
}

variable "storage_mariadb" {
  type        = string
  default     = "/usr/local/mariadb"
  description = "Path of data, on host"
}
