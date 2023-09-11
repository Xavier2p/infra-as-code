variable "hostname" {}
variable "path_config" {}
variable "resolver_ssl" {}
variable "entrypoint" {}
variable "traefik_enable" {}
variable "tls_enable" {}
variable "domain_name" {}

variable "network" {
  type        = string
  description = "Docker network name"
}
