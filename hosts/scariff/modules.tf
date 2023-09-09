module "monitoring" {
  source = "./monitoring"

  providers = {
    docker = docker
  }

  network              = docker_network.main.name
  hostname             = var.hostname
  path_config          = var.path_config
  entrypoint           = var.entrypoint
  tls_enable           = var.tls_enable
  domain_name          = var.domain_name
  resolver_ssl         = var.resolver_ssl
  traefik_enable       = var.traefik_enable
  adguard_api_password = var.adguard_api_password
}

# module "media" {
#   source = "./media"

# providers = {
#   docker = docker
# }

#   network        = docker_network.main.name
#   hostname       = var.hostname
#   path_config    = var.path_config
#   entrypoint     = var.entrypoint
#   tls_enable     = var.tls_enable
#   domain_name    = var.domain_name
#   resolver_ssl   = var.resolver_ssl
#   traefik_enable = var.traefik_enable
#   path_downloads = var.path_downloads
# }
