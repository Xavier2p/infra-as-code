resource "docker_network" "madalore" {
  name   = "madalore"
  driver = "bridge"
}

resource "docker_network" "public" {
  name   = "public"
  driver = "bridge"
}
