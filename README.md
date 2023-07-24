# Infrastructure as Code - [Xavier2p](https://github.com/Xavier2p)

![GitHub top language](https://img.shields.io/github/languages/top/xavier2p/infra-as-code?style=for-the-badge&logo=terraform&label=terraform&color=%237B42BC)

> This repository contains the code of my infrastructure.

## Hosts

+ [`scariff`](./hosts/scariff/README.md): My main server, a Raspberry Pi 4.
+ [`exegol`](./hosts/exegol/README.md): My laptop, a MacBook Air M1.
+ [`mandalore`](./hosts/mandalore/README.md): My development server, a Dell PowerEdge R710.

## Tools

+ My servers run on [NixOS](https://github.com/Xavier2p/system).
+ I use [`Docker`](https://www.docker.com/) to run my services.
+ For configuration, I use [`Ansible`](https://www.ansible.com/).
+ For deployment, I use [`Terraform`](https://www.terraform.io/).

<!-- ## Install

### Prerequisites

1. Install `Rasberry Pi OS Lite 64 bits` on your Raspberry Pi.
2. Get the IP address of your Raspberry Pi.
3. Install `Ansible` on your computer.
4. Install `Terraform` on your computer.

### Configure your Raspberry Pi

```bash
cd raspberry-pi/ansible
ansible-playbook -i hosts.yml -l <IP_ADDRESS> -u <USER> -k -b playbook.yml
```

### Install the whole infra

```bash
cd ../terraform
terraform init
terraform apply
``` -->
