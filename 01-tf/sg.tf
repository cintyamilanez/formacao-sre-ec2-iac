resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.wordpress_vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "allow_prometheus_port" {
  name        = "allow_prometheus_port"
  description = "Allow TCP Prometheus inbound traffic"
  vpc_id      = data.aws_vpc.wordpress_vpc.id

  ingress {
    description      = "Port for prometheus"
    from_port        = var.prometheus_port
    to_port          = var.prometheus_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_prometheus_port"
  }
}

resource "aws_security_group" "allow_wordpress_ports" {
  name        = "allow_wordpress_port"
  description = "Allow TCP wordpress inbound traffic"
  vpc_id      = data.aws_vpc.wordpress_vpc.id

  ingress {
    description      = "Port for wordpress"
    from_port        = var.wordpress_port
    to_port          = var.wordpress_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = var.wordpress_db_port
    to_port          = var.wordpress_db_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_wordpress_port"
  }
}