provider "docker" {
  host  = "unix:///var/run/docker.sock"
  alias = "exegol"
}

provider "docker" {
  host  = "tcp://${var.eadu.ip}:2375"
  alias = "eadu"
}

provider "docker" {
  host  = "tcp://${var.scariff.ip}:2375"
  alias = "scariff"
}
