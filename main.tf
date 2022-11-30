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
  cidr_block = "172.30.0.0/16"

  tags = {
    Name = "MiraclesVPC"
  }
}
# # Provisioning EC2
# resource "aws_instance" "MiracleEC2" {
#   ami           = "ami-094125af156557ca2" # us-west-2
#   instance_type = "t2.micro"
#   key_name = "Miraclekey"
#   tags = {
#     Name = "MiracleEC2"
#   }
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_ssh"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }