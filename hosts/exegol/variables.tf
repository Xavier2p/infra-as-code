// Create a `exegol.tfvars` to store the values of the variables.

variable "password_mariadb" {
  type        = string
  sensitive   = true
  description = "Password for MariaDB"
}

variable "server_name" {
  type        = string
  default     = "exegol"
  description = "Name of the server"
}
