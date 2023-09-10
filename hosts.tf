module "scariff" {
  source = "./hosts/scariff"

  providers = {
    docker = docker.scariff
  }
}

module "exegol" {
  source = "./hosts/exegol"

  providers = {
    docker = docker.exegol
  }
}

module "eadu" {
  source = "./hosts/eadu"

  providers = {
    docker = docker.eadu
  }
}
