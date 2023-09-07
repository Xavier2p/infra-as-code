resource "docker_image" "cadvisor" {
  name = "zcube/cadvisor:latest"
}

resource "docker_container" "cadvisor" {
  name       = "cadvisor"
  image      = docker_image.cadvisor.name
  restart    = "unless-stopped"
  privileged = true

  devices {
    host_path = "/dev/ksmg"
  }

  volumes {
    container_path = "/rootfs"
    host_path      = "/"
    read_only      = true
  }
  volumes {
    container_path = "/var/run"
    host_path      = "/var/run"
    read_only      = false
  }
  volumes {
    container_path = "/sys"
    host_path      = "/sys"
    read_only      = true
  }
  volumes {
    container_path = "/var/lib/docker"
    host_path      = "/var/lib/docker"
    read_only      = true
  }
  volumes {
    container_path = "/dev/disk"
    host_path      = "/dev/disk"
    read_only      = true
  }

  networks_advanced {
    name = var.hostname
  }

  depends_on = [
    docker_image.cadvisor
  ]
}
