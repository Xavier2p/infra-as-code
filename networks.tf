resource "docker_network" "exegol" {
  provider = docker.exegol

  name = "${var.exegol.host_name}-${var.exegol.env}"
}

# resource "docker_network" "eadu" {
#   provider = docker.eadu

#   name = "${var.eadu.host_name}-${var.eadu.env}"
# }

resource "docker_network" "scariff" {
  provider = docker.scariff

  name = "${var.scariff.host_name}-${var.scariff.env}"
}
