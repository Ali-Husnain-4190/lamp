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

module "Ec2" {
source="./Ec2"
ami_id=var.ami_id
# instance_type=var.instance_type
env_name=var.env_name
vpc_id=module.networking.vpc_id
subnet_id = module.networking.public_subnet_id
}
output "vpc_id" {
  value = module.networking.vpc_id
}
output "public_subnet" {
  value = module.networking.public_subnet_id
}
output "security_group_id" {
  value = module.networking.public_sg
}
