# `/forge` - Infrastructure as Code

[![GitHub top language](https://img.shields.io/github/languages/top/xavier2p/infra-as-code?style=for-the-badge&logo=terraform&label=terraform&color=%237B42BC)](https://www.terraform.io/)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/xavier2p/infra-as-code/ci.yml?style=for-the-badge&logo=github-actions&label=validation)
[![Website](https://img.shields.io/website?up_message=UP&down_message=DOWN&url=https%3A%2F%2Fxavier2p.fr&style=for-the-badge&logo=mdbook&label=docs)
](https://xavier2p.fr)
[![GitHub](https://img.shields.io/github/license/xavier2p/infra-as-code?style=for-the-badge&logo=github&color=yellow)](../LICENSE.md)

> This repository contains the code of `/forge`, my personal infrastructure.

## Hosts

+ [`scariff`](../hosts/scariff): My main server, a Raspberry Pi 4.
+ [`exegol`](../hosts/exegol): My laptop, a MacBook Air M1.
+ [`eadu`](../hosts/eadu): A simple Debian VM, used for testing.
+ [`mandalore`](../hosts/mandalore): My development server, a Dell PowerEdge R710 (upcoming...).

## Tools

+ My servers run on [`NixOS`](https://github.com/Xavier2p/system).
+ I use [`Docker`](https://www.docker.com/) to run my services.
+ For configuration, I use [`Ansible`](https://www.ansible.com/).
+ For deployment, I use [`Terraform`](https://www.terraform.io/).

## Structure

```bash
./forge
├── ansible             # Ansible configuration, pre-deployment
├── hosts               # Hosts configuration
│   ├── common          # Common configuration for all hosts
│   ├── exegol
│   ├── eadu
│   └── scariff
├── stacks              # Stacks of services
│   ├── admin
│   ├── cloud
│   ├── monitoring
│   ├── media
│   └── services
├── hosts.tf            # Hosts configuration
├── main.tf             # Entry point
├── modules             # Terraform modules
├── providers.tf
├── outputs.tf
├── variables.tf
└── forge.tfvars        # Private variables
```

## Deployment

### #1 Clone repository

```bash
git clone https://github.com/Xavier2p/infra-as-code.git && cd infra-as-code
```

### #2 Pre-deploy configuration (using Ansible)

```bash
ansible-playbook -i ansible/hosts.yml -u <USER> -b ansible/playbook.yml
```

### #3 Deploy infrastructure (using Terraform)

```bash
terraform init
terraform apply
```

You can use the `-target=module.<module_name>` option to deploy only a specific module or a specific host.

## License - MIT

```txt
MIT License

Copyright (c) 2023 Xavier2p

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
