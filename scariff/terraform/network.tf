resource "docker_network" "scariff" {
  name   = "scariff"
  driver = "bridge"
}
