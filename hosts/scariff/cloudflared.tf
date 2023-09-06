resource "docker_image" "cloudflared" {
  name = "cloudflare/cloudflared:latest"
}

resource "docker_container" "cloudflared" {
  name    = "cloudflared"
  image   = docker_image.cloudflared.name
  restart = "unless-stopped"

  env = [
    "TUNNEL_TOKEN=${var.cloudflare_tunnel_token}",
  ]

  entrypoint = [
    "tunnel",
    "--no-autoupdate",
    "run"
  ]

  networks_advanced {
    name = docker_network.main.name
  }

  depends_on = [
    docker_image.cloudflared,
    docker_network.main,
  ]
}
