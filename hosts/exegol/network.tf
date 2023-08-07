resource "docker_network" "exegol" {
  name   = "exegol"
  driver = "bridge"
}
