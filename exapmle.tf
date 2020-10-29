
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}


provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-05eb55e1010cc2d49"]
  subnet_id = "subnet-0079cd18a96a1954a"
}
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}


