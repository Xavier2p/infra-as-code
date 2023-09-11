// Create a `scariff.tfvars` to store the values of the variables.

variable "domain_name" {}
variable "path_downloads" {}
variable "path_config" {}
variable "cloudflare_tunnel_token" {}
variable "resolver_ssl" {}
variable "entrypoint" {}
variable "traefik_enable" {}
variable "tls_enable" {}
variable "cloudflare_api_token" {}
variable "cloudflare_user_id" {}
variable "cloudflare_tunnel_id" {}
variable "adguard_api_password" {}
variable "grafana_username" {}
variable "grafana_password" {}

variable "network" {
  type        = string
  description = "Docker network name"
}
