# `scariff`

On the `scariff` server, there are some services:

+ [AdGuard-Home](https://adguard.com/en/adguard-home/overview.html): DNS server with ad blocker.
+ [Portainer Agent](https://www.portainer.io/): Docker management.
+ [Uptime Kuma](https://github.com/louislam/uptime-kuma): Uptime monitoring.
+ [Dozzle](https://dozzle.dev/): Docker logs viewer.
+ [Traefik](https://traefik.io/): Reverse proxy.
+ [Code-Server](https://github.com/coder/code-server): VS Code in the browser.
+ [Homepage](https://github.com/benphelps/homepage): Admin Dashboard.
+ [Homer](https://github.com/bastienwirtz/homer): External Dashboard.

To install all of them:

```bash
terraform init
terraform apply
```

If you create a file to store the variables:

```bash
touch scariff.tfvars
# edit the file
terraform apply -var-file="scariff.tfvars"
```
