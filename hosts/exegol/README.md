# `exegol`

On the `exegol` server, there are some services:

+ [MariaDB](https://mariadb.org/): Database.
+ [Grafana](https://grafana.com/): Monitoring.

To install all of them:

```bash
terraform init
terraform apply
```

If you create a file to store the variables:

```bash
touch exegol.tfvars
# edit the file
terraform apply -var-file="exegol.tfvars"
```
