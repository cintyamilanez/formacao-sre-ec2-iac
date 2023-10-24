module "wordpress_ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "wordpress-server"

  ami                    = data.aws_ami.wordpress_ami.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.server.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = [aws_security_group.allow_ssh.id, aws_security_group.allow_wordpress_port.id]
  subnet_id              = data.aws_subnet.wordpress_public_subnet.id
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Terraform = "true"
  }

}

resource "aws_eip" "wordpress_eip" {
  instance = module.wordpress_ec2_instance.id
  vpc      = true
}