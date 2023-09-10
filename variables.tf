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
