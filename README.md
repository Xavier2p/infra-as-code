# Infra as Code - [Xavier2p](https://github.com/Xavier2p)

> This repository contains the code of my infrastructure.

## Devices

I use one Raspberry Pi 4 (4GB) for the moment.

## Tools

+ My server runs on [`Raspberry Pi OS Lite 64 bits`](https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-64-bit).
+ I use [`Docker`](https://www.docker.com/) to run my services.
+ For configuration, I use [`Ansible`](https://www.ansible.com/).
+ For deployment, I use [`Terraform`](https://www.terraform.io/) and Docker Compose.

## Install

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
```
