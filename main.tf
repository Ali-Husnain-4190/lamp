terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}





module "networking" {
  source              = "./networking"
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  tag_name            = var.tag_name
}



# resource "aws_instance" "app_server" {
#   ami           = "ami-830c94e3"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }
