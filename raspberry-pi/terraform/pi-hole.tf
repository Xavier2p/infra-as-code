resource "docker_image" "pi_hole" {
  name = "pihole/pihole:latest"
}

resource "docker_container" "pi_hole" {
  name    = "pi_hole"
  image   = docker_image.pi_hole.name
  restart = "unless-stopped"
  env = [
    "TZ=Europe/Paris",
    "WEBPASSWORD=pihole",
  ]
  capabilities {
    add = ["NET_ADMIN"]
  }
  ports {
    internal = 53
    external = 53
  }
  ports {
    internal = 53
    external = 53
    protocol = "udp"
  }

  ports {
    internal = 67
    external = 67
    protocol = "udp"
  }

  ports {
    internal = 80
    external = 8080
  }
  volumes {
    container_path = "/etc/pihole"
    host_path      = "/home/sysadmin/pihole/etc-pihole"
  }
  volumes {
    container_path = "/etc/dnsmasq.d"
    host_path      = "/home/sysadmin/pihole/etc-dnsmasq.d"
  }
}
