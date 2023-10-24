resource "local_file" "server_wordpress_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${path.module}/../02-ansible/${var.server_wordpress_key_filename}"
  file_permission = "0600"
}

resource "local_file" "ansible_hosts" {
  filename = "${path.module}/../02-ansible/hosts"
  content  = <<EOF
  [wordpress]
  ${aws_eip.wordpress_eip.public_ip}

  [wordpress:vars]
  ansible_private_key_file=./${var.server_wordpress_key_filename}
  ansible_user=ubuntu
  EOF
}

resource "local_file" "ansible_vars_default" {
  filename = "${path.module}/../02-ansible/vars-default.yaml"
  content  = <<EOF
  admin_user: ${var.admin_user}
  project_required_packages:
  %{for packages in var.project_required_packages~}
  - ${packages}
  %{endfor~}

  docker_gpg_url: ${var.docker_gpg_url}
  docker_repo: ${var.docker_repo}
  docker_packages:
  %{for packages in var.docker_packages~}
  - ${packages}
  %{endfor~}

  docker_compose_url: ${var.docker_compose_url}
  python_docker_modules:
  %{for packages in var.python_docker_modules~}
  - ${packages}
  %{endfor~}

  docker_compose_project_path: ${var.docker_compose_project_path}
  EOF
}

resource "local_file" "ansible_docker_compose" {
  filename = "${path.module}/../02-ansible/docker-compose.yml"
  content  = <<EOF
  version: '3.8'

  services:
    wordpress:
      image: '${var.wordpress_image}'
      restart: always
      ports:
        - ${var.wordpress_port}:80
      container_name: 'wordpress'
  EOF
}