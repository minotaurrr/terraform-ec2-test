terraform {
  backend "remote" {
    organization = "min-dev"
    workspaces {
      name = "terraform-ec2-test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-044c46b1952ad5861"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}