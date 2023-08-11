resource "docker_network" "main" {
  name   = var.hostname
  driver = "bridge"
}

resource "docker_network" "public" {
  name   = "${var.hostname}-public"
  driver = "bridge"
}
