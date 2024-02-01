terraform {
  cloud {
    organization = "Bynet1"
    workspaces {
      name = "w1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}
#############################################

resource "aws_vpc" "testvpc" {
    cidr_block = "192.168.1.0/24"
}

resource "aws_subnet" "testsubnet" {
  vpc_id     = aws_vpc.testvpc.id
  cidr_block = "192.168.1.0/27"
}

resource "aws_instance" "testserver" {
  ami           = var.ami
  instance_type = var.instance_type
}