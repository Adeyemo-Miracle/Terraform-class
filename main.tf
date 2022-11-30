terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.41.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-west-2"
#   access_key = 
    # secret_key = 
}

# creating a VPC
resource "aws_vpc" "MiraclesVPC" {
  cidr_block = var.cidr_block[0]

  tags = {
    Name = "MiraclesVPC"
  }
}
# # Provisioning EC2
resource "aws_instance" "MiracleEC2" {
  ami           = var.ami # us-west-2
  instance_type = var.instance_type[0]
  key_name = "Miraclekey"
  tags = {
    Name = "MiracleEC2"
  }
}

## security group
resource "aws_security_group" "MiraclesSG" {
  name        = "MiraclesSG"
  description = "Allow SSH inbound traffic"


  # vpc_id      = aws_vpc.main.id

  dynamic ingress {
    # description = "Allowed ports"
    iterator = port
    for_each = var.ports
    content{
      from_port = port.value
      to_port = port.value
      protocol         = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # from_port        = 22
    # to_port          = 22

    # cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
# creating subnets
resource "aws_subnet" "MiraclesSUBNET" {
  vpc_id     = aws_vpc.MiraclesVPC.id
  cidr_block = var.cidr_block[0]

  tags = {
    Name = "MiraclesSUBNET"
  }
}