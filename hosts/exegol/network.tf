resource "docker_network" "main" {
  name   = var.hostname
  driver = "bridge"
}
