# resource "docker_image" "node_exporter" {
#   name = "prom/node-exporter:latest"
# }

# resource "docker_container" "node_exporter" {
#   name    = "node-exporter"
#   image   = docker_image.node_exporter.name
#   restart = "unless-stopped"

#   networks_advanced {
#     name = docker_network.monitoring.name
#   }

#   depends_on = [
#     docker_image.node_exporter,
#     docker_network.monitoring
#   ]
# }
