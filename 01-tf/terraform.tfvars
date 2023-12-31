# Security Group Module:
vpc_name          = ["formacao-sre-network-vpc"]
vpc_public_subnet = ["10.0.101.0/24"]
sg_cidr_blocks    = ["0.0.0.0/0"]

# Instance Module:
ami_name             = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
ami_owner            = ["099720109477"] # Ubuntu
instance_type        = "t3.micro"
key_name             = "wordpress_key"
monitoring           = true
iam_instance_profile = "wordpress_instance_profile"
iam_role             = "wordpress_role"
prometheus_version   = "2.47.2"
prometheus_port      = 9090
wordpress_port       = 80
wordpress_db_port    = 3306
wordpress_db_user    = "admin"
wordpress_db_name    = "wordpress"


# Ansible Config:
admin_user                    = "ubuntu"
server_wordpress_key_filename = "wordpress.pem"
docker_gpg_url                = "https://download.docker.com/linux/ubuntu/gpg"
docker_repo                   = "deb https://download.docker.com/linux/ubuntu focal stable"
docker_compose_url            = "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-linux-x86_64"
docker_compose_project_path   = "~/formacao-sre-wordpress-docker"
project_required_packages     = ["apt-transport-https", "ca-certificates", "curl", "gnupg-agent", "software-properties-common", "python3-pip", "python3-setuptools"]
docker_packages               = ["docker-ce=5:20.10.21~3-0~ubuntu-focal", "docker-ce-cli=5:20.10.21~3-0~ubuntu-focal", "containerd.io=1.6.9-1"]
python_docker_modules         = ["docker==6.0.1", "docker-compose==1.29.2"]

# Docker Compose Config:
wordpress_image = "wordpress:latest"