# Security Group Module:

variable "vpc_name" {
  type = list(string)
}

variable "vpc_public_subnet" {
  type = list(string)
}

variable "sg_cidr_blocks" {
  type = list(string)
}

variable "wordpress_port" {
  type = number
}

# Instance Module:

variable "ami_name" {
  type = list(string)
}

variable "ami_owner" {
  type = list(string)
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "monitoring" {
  type = bool
}

variable "iam_instance_profile" {
  type = string
}

variable "iam_role" {
  type = string
}

# Ansible Config:

variable "admin_user" {
  type = string
}

variable "server_wordpress_key_filename" {
  type = string
}

variable "docker_gpg_url" {
  type = string
}

variable "docker_repo" {
  type = string
}

variable "docker_compose_url" {
  type = string
}

variable "docker_compose_project_path" {
  type = string
}

variable "project_required_packages" {
  type = list(string)
}

variable "docker_packages" {
  type = list(string)
}

variable "python_docker_modules" {
  type = list(string)
}

# Docker Compose Config:

variable "wordpress_image" {
  type = string
}