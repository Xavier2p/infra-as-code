# `mandalore`

On the `mandalore` server, there are some services:

+ [Portainer](https://www.portainer.io/): Container management.
+ [FreshRSS](https://freshrss.org/): RSS reader.
+ [Jellyfin](https://jellyfin.org/): Media server.
+ [Nextcloud](https://nextcloud.com/): Cloud storage.
+ Others...

To install all of them:

```bash
terraform init
terraform apply
```

If you create a file to store the variables:

```bash
touch mandalore.tfvars
# edit the file
terraform apply -var-file="mandalore.tfvars"
```
