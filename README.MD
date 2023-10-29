# Formação SRE EC2 IaC

This project "**formacao-sre-ec2-iac**" is about creating an **EC2 instance infrastructure** as code using Terraform, along with a security group and Elastic IP. The project also includes **Ansible files for provisioning the instance and running Prometheus and Docker Compose with Wordpress**. The project is structured into two main folders: "**01-tf**" for the Terraform code and "**02-ansible**" for the Ansible files. When the Terraform apply command is executed in the "01-tf" folder, the necessary files are dynamically generated with the information of the new EC2 instance created for the execution of Ansible and Docker Compose in the "02-ansible" folder.

### project folder structure

The project contains two main folders, separating the terraform HCL source code that provisions the EC2 instance with the security group, Elastic Ip and ansible files:

1. **01-tf**
2. **02-ansible**

As soon as the terraform apply command is applied inside the `01-tf` folder, the necessary files are dynamically generated with the information of the new EC2 instance created for the execution of ansible and docker compose in the `02-ansible` folder (dynamic files generated in the `01-tf/local_files_ansible.tf`).

## 01-tf Project

## Usage

To run this example you need to execute:

```bash
$ cd 01-tf/
$ terraform init
$ terraform plan
$ terraform apply
```
## 02-ansible

## Usage

To run this example you need to execute:

```bash
$ cd 02-ansible/
$ ansible-galaxy collection install community.general
$ ansible-galaxy collection install prometheus.prometheus
$ ansible-playbook playbook_wordpress.yaml
```

### Requirements

No requirements.

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_wordpress_ec2_instance"></a> [wordpress\_ec2\_instance](#module\_wordpress\_ec2\_instance) | terraform-aws-modules/ec2-instance/aws | n/a |

### Resources

| Name | Type |
|------|------|
| [aws_eip.wordpress_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_iam_instance_profile.wordpress_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy_attachment.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.wordpress_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_key_pair.server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.allow_prometheus_port](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_wordpress_ports](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.ansible_docker_compose](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ansible_hosts](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ansible_vars_default](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.server_wordpress_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.wordpress_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_secretsmanager_secret_version.wp_password_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_ssm_parameter.aws_secretsmanager_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.wp_db_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_subnet.wordpress_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.wordpress_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | n/a | `string` | n/a | yes |
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | n/a | `list(string)` | n/a | yes |
| <a name="input_ami_owner"></a> [ami\_owner](#input\_ami\_owner) | n/a | `list(string)` | n/a | yes |
| <a name="input_docker_compose_project_path"></a> [docker\_compose\_project\_path](#input\_docker\_compose\_project\_path) | n/a | `string` | n/a | yes |
| <a name="input_docker_compose_url"></a> [docker\_compose\_url](#input\_docker\_compose\_url) | n/a | `string` | n/a | yes |
| <a name="input_docker_gpg_url"></a> [docker\_gpg\_url](#input\_docker\_gpg\_url) | n/a | `string` | n/a | yes |
| <a name="input_docker_packages"></a> [docker\_packages](#input\_docker\_packages) | n/a | `list(string)` | n/a | yes |
| <a name="input_docker_repo"></a> [docker\_repo](#input\_docker\_repo) | n/a | `string` | n/a | yes |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | n/a | `string` | n/a | yes |
| <a name="input_iam_role"></a> [iam\_role](#input\_iam\_role) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | n/a | `bool` | n/a | yes |
| <a name="input_project_required_packages"></a> [project\_required\_packages](#input\_project\_required\_packages) | n/a | `list(string)` | n/a | yes |
| <a name="input_prometheus_port"></a> [prometheus\_port](#input\_prometheus\_port) | n/a | `number` | n/a | yes |
| <a name="input_prometheus_version"></a> [prometheus\_version](#input\_prometheus\_version) | n/a | `string` | n/a | yes |
| <a name="input_python_docker_modules"></a> [python\_docker\_modules](#input\_python\_docker\_modules) | n/a | `list(string)` | n/a | yes |
| <a name="input_server_wordpress_key_filename"></a> [server\_wordpress\_key\_filename](#input\_server\_wordpress\_key\_filename) | n/a | `string` | n/a | yes |
| <a name="input_sg_cidr_blocks"></a> [sg\_cidr\_blocks](#input\_sg\_cidr\_blocks) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_public_subnet"></a> [vpc\_public\_subnet](#input\_vpc\_public\_subnet) | n/a | `list(string)` | n/a | yes |
| <a name="input_wordpress_db_name"></a> [wordpress\_db\_name](#input\_wordpress\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_wordpress_db_port"></a> [wordpress\_db\_port](#input\_wordpress\_db\_port) | n/a | `number` | n/a | yes |
| <a name="input_wordpress_db_user"></a> [wordpress\_db\_user](#input\_wordpress\_db\_user) | n/a | `string` | n/a | yes |
| <a name="input_wordpress_image"></a> [wordpress\_image](#input\_wordpress\_image) | n/a | `string` | n/a | yes |
| <a name="input_wordpress_port"></a> [wordpress\_port](#input\_wordpress\_port) | n/a | `number` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_prometheus_aws_elastic_ip"></a> [prometheus\_aws\_elastic\_ip](#output\_prometheus\_aws\_elastic\_ip) | Public IP address of the prometheus port. Access with the HTTP protocol. Example: http://44.206.118.193:9090 |
| <a name="output_wordpress_aws_elastic_ip"></a> [wordpress\_aws\_elastic\_ip](#output\_wordpress\_aws\_elastic\_ip) | Public IP and PORT of the wordpress instance. Access with the HTTP protocol. Example: http://44.206.118.193:80 |

![image](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white) ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)