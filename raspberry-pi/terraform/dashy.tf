# resource "docker_image" "dashy" {
#   name = "dashy:latest"
# }

# resource "docker_container" "dashy" {
#   name  = "dashy"
#   image = docker_image.dashy.name
#   ports {
#     internal = 80
#     external = 4000
#   }
#   restart = "always"
#   depends_on = [
#     docker_image.dashy
#   ]
# }
