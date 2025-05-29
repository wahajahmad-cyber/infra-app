# Key pair needed for login
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment = var.env
  }
}

# Default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "my_sec_group" {
  name        = "${var.env}-infra-app-sg"
  description = "This is a TF generated sec-group"
  vpc_id      = aws_default_vpc.default.id

  # Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All access to ports"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}
   #ec2 instance
   resource "aws_instance" "my_instance" {
     count             = var.instance_count
     key_name          = aws_key_pair.my_key.key_name
     security_groups   = [aws_security_group.my_sec_group.name]
     instance_type     = var.instance_type
     ami               = var.ec2_ami_id #ubuntu
     root_block_device {
       volume_size = var.env == "prod" ? 20 : 10
       volume_type = "gp3"
     }
     tags = {
       Name        = "${var.env}-infra-app-instance"
       Environment = var.env
     }
   }