resource "docker_image" "dozzle" {
  name = "amir20/dozzle:latest"
}

resource "docker_container" "dozzle" {
  name  = "dozzle"
  image = docker_image.dozzle.name
  ports {
    internal = 8080
    external = 8888
  }
  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
  }
  restart = "always"
  depends_on = [
    docker_image.dozzle
  ]
}
