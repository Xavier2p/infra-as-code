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

  command = [
    "tunnel",
    "--no-autoupdate",
    "run"
  ]

  networks_advanced {
    name = var.network
  }

  depends_on = [
    docker_image.cloudflared,
  ]
}
