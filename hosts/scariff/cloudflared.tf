# resource "docker_image" "cloudflared" {
#   name = "cloudflare/cloudflared:latest"
# }

# resource "docker_container" "cloudflared" {
#   name    = "cloudflared"
#   image   = docker_image.cloudflared.name
#   restart = "always"
#   entrypoint = [
#     "tunnel",
#   ]

#   networks_advanced {
#     name = docker_network.public.name
#   }

#   depends_on = [
#     docker_image.cloudflared,
#     docker_network.public,
#   ]
# }
