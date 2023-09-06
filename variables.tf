variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
variable "availability_zone" {
  type = string
}


variable "tag_name" {
  type = map(string)
  default = {
    Environment_type  = "DEV"
    User              = "alihusnain"
    Project           = "test-image"
    Deployment_method = "terraform_local"
  }
}

variable "env_name" {
  type = string
}
