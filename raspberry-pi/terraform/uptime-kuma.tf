resource "docker_image" "uptime_kuma" {
  name = "uptimekuma/uptime-kuma:latest"
}

resource "docker_container" "uptime_kuma" {
  name  = "uptime_kuma"
  image = docker_image.uptime_kuma.name
  ports {
    internal = 3001
    external = 4040
  }
  restart = "always"
  volumes {
    container_path = "/app/data"
    host_path      = "/home/sysadmin/uptime-kuma/"
  }
  depends_on = [
    docker_image.uptime_kuma
  ]
}
