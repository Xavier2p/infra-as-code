module "scariff" {
  source = "./hosts/scariff"

  providers = {
    docker = docker.scariff
  }

  network                 = docker_network.scariff.name
  entrypoint              = var.entrypoint
  traefik_enable          = var.traefik_enable
  resolver_ssl            = var.resolver_ssl
  tls_enable              = var.tls_enable
  domain_name             = var.domain_name
  path_config             = var.path_config
  path_downloads          = var.path_downloads
  grafana_password        = var.grafana_password
  grafana_username        = var.grafana_username
  cloudflare_user_id      = var.cloudflare_user_id
  cloudflare_api_token    = var.cloudflare_api_token
  cloudflare_tunnel_token = var.cloudflare_tunnel_token
  cloudflare_tunnel_id    = var.cloudflare_tunnel_id
  adguard_api_password    = var.adguard_api_password
}

module "exegol" {
  source = "./hosts/exegol"

  providers = {
    docker = docker.exegol
  }

  network            = docker_network.exegol.name
  password_mariadb   = var.password_mariadb
  password_surrealdb = var.password_surrealdb
  storage_surrealdb  = var.storage_surrealdb
  storage_mariadb    = var.storage_mariadb
  user_surrealdb     = var.user_surrealdb
}

module "eadu" {
  source = "./hosts/eadu"

  providers = {
    docker = docker.eadu
  }
}

module "common-exegol" {
  source = "./hosts/common"

  providers = {
    docker = docker.exegol
  }

  network = docker_network.exegol.name
}

# module "common-eadu" {
#   source = "./hosts/common"

#   providers = {
#     docker = docker.eadu
#   }

#   network = docker_network.eadu.name
# }

module "common-scariff" {
  source = "./hosts/common"

  providers = {
    docker = docker.scariff
  }

  network = docker_network.scariff.name
}
