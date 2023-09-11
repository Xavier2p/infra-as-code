variable "eadu" {
  type = object({
    ip        = string
    env       = string
    host_name = string
  })
  description = "Eadu Docker Host"
}

variable "exegol" {
  type = object({
    ip        = string
    env       = string
    host_name = string
  })
  description = "Exegol Docker Host"
}

variable "scariff" {
  type = object({
    ip        = string
    env       = string
    host_name = string
  })
  description = "Scariff Docker Host"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the server"
}

variable "path_config" {
  type        = string
  description = "Path of the config folder"
}

variable "resolver_ssl" {
  type        = string
  description = "SSL resolver for Traefik. can be 'staging' or 'production'"
}

variable "entrypoint" {
  type        = string
  description = "Entrypoint for Traefik. can be 'web' or 'websecure'"
}

variable "traefik_enable" {
  type        = bool
  description = "Enable Traefik"
}

variable "tls_enable" {
  type        = bool
  description = "Enable TLS"
}

variable "path_downloads" {
  type        = string
  description = "Path of the downloads folder"
}

variable "cloudflare_tunnel_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare Tunnel token"
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API token"
}

variable "cloudflare_user_id" {
  type        = string
  sensitive   = true
  description = "Cloudflare user ID"
}

variable "cloudflare_tunnel_id" {
  type        = string
  sensitive   = true
  description = "Cloudflare tunnel ID"
}

variable "adguard_api_password" {
  type        = string
  sensitive   = true
  description = "Adguard API password"
}

variable "grafana_username" {
  type        = string
  description = "Grafana username"
}

variable "grafana_password" {
  type        = string
  sensitive   = true
  description = "Grafana password"
}

variable "password_mariadb" {
  type        = string
  sensitive   = true
  description = "Password for MariaDB"
}

variable "user_surrealdb" {
  type        = string
  description = "User to connect to SurrealDB"
}

variable "password_surrealdb" {
  type        = string
  sensitive   = true
  description = "Password for SurrealDB"
}

variable "storage_surrealdb" {
  type        = string
  description = "Path of data, in container"
}

variable "storage_mariadb" {
  type        = string
  description = "Path of data, on host"
}
