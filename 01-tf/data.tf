# Security Group Module:

data "aws_vpc" "wordpress_vpc" {
  filter {
    name   = "tag:Name"
    values = var.vpc_name
  }
}

data "aws_subnet" "wordpress_public_subnet" {
  filter {
    name   = "cidr-block"
    values = var.vpc_public_subnet
  }
}

# Instance Module:

data "aws_ami" "wordpress_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_name
  }

  owners = var.ami_owner
}