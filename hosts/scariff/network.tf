resource "docker_network" "scariff" {
  name   = "scariff"
  driver = "bridge"
}

resource "docker_network" "public" {
  name   = "public"
  driver = "bridge"
}
