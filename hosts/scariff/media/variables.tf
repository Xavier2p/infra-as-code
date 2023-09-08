variable "domain_name" {
  type        = string
  description = "Domain name for the server"
}

variable "hostname" {
  type        = string
  description = "Name of the server"
}

variable "path_downloads" {
  type        = string
  description = "Path to the downloads folder"
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

variable "network" {
  type        = string
  description = "Name of the Docker network"
}
