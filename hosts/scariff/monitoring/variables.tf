variable "domain_name" {
  type        = string
  description = "Domain name for the server"
}

variable "network" {
  type        = string
  description = "Name of the network"
}

variable "hostname" {
  type        = string
  description = "Name of the server"
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

variable "adguard_api_password" {
  type        = string
  sensitive   = true
  description = "Adguard API password"
}
