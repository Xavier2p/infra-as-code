# resource "docker_image" "cadvisor" {
#   name = "google/cadvisor:latest"
# }

# resource "docker_container" "cadvisor" {
#   name    = "cadvisor"
#   image   = docker_image.cadvisor.name
#   restart = "unless-stopped"

#   volumes {
#     container_path = "/"
#     host_path      = "/rootfs"
#     read_only      = true
#   }
#   volumes {
#     container_path = "/var/run"
#     host_path      = "/var/run"
#     read_only      = false
#   }
#   volumes {
#     container_path = "/sys"
#     host_path      = "/sys"
#     read_only      = true
#   }
#   volumes {
#     container_path = "/var/lib/docker"
#     host_path      = "/var/lib/docker"
#     read_only      = true
#   }

#   networks_advanced {
#     name = docker_network.monitoring.name
#   }

#   depends_on = [
#     docker_image.cadvisor,
#     docker_network.monitoring
#   ]
# }
