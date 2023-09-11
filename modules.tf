module "monitoring" {
  source = "./stacks/monitoring"

  providers = {
    docker = docker.scariff
  }

  # vars
  network        = docker_network.scariff.name
  path_config    = var.path_config
  hostname       = var.scariff.host_name
  entrypoint     = var.entrypoint
  traefik_enable = var.traefik_enable
  resolver_ssl   = var.resolver_ssl
  tls_enable     = var.tls_enable
  domain_name    = var.domain_name
}

# module "media" {
#   source = "./stacks/media"

#   providers = {
#     docker = docker.eadu
#   }

#   network        = docker_network.eadu.name
#   domain_name    = var.domain_name
#   entrypoint     = var.entrypoint
#   path_downloads = var.path_downloads
#   path_config    = var.path_config
#   resolver_ssl   = var.resolver_ssl
#   traefik_enable = var.traefik_enable
#   tls_enable     = var.tls_enable
# }

# module "admin" {
#   source = "./stacks/admin"

#   providers = {
#     docker = docker.eadu
#   }
# }

# module "cloud" {
#   source = "./stacks/cloud"

#   providers = {
#     docker = docker.eadu
#   }

#   network        = docker_network.eadu.name
#   domain_name    = var.domain_name
#   entrypoint     = var.entrypoint
#   path_downloads = var.path_downloads
#   path_config    = var.path_config
#   resolver_ssl   = var.resolver_ssl
#   traefik_enable = var.traefik_enable
#   tls_enable     = var.tls_enable
# }

# module "services" {
#   source = "./stacks/services"

#   providers = {
#     docker = docker.scariff
#   }
# }
