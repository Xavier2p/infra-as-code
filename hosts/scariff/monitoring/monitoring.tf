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

variable "domain_name" {
  type        = string
  default     = "xavier2p.fr"
  description = "Domain name for the server"
}

variable "hostname" {
  type        = string
  default     = "scariff"
  description = "Name of the server"
}

variable "path_config" {
  type        = string
  default     = "/docker"
  description = "Path of the config folder"
}

variable "resolver_ssl" {
  type        = string
  default     = "staging"
  description = "SSL resolver for Traefik. can be 'staging' or 'production'"
}

variable "entrypoint" {
  type        = string
  default     = "web"
  description = "Entrypoint for Traefik. can be 'web' or 'websecure'"
}

variable "traefik_enable" {
  type        = bool
  default     = true
  description = "Enable Traefik"
}

variable "tls_enable" {
  type        = bool
  default     = false
  description = "Enable TLS"
}

variable "adguard_api_password" {
  type        = string
  sensitive   = true
  description = "Adguard API password"
}
