# resource "docker_image" "pivpn_web" {
#   name = "weejewel/pivpn-web:latest"
# }

# resource "docker_container" "pivpn_web" {
#   name  = "pivpn_web"
#   image = docker_image.pivpn_web.name
#   ports {
#     internal = 51821
#     external = 51821
#   }
#   env     = ["ENABLE_2FA=yes"]
#   restart = "always"
#   depends_on = [
#     docker_image.pivpn_web
#   ]
# }
