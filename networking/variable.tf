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
variable "public_subnet_cidr_2" {
  type = string
}
variable "private_subnet_cidr_2" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "availability_zone_2" {
  type = string
}
variable "tag_name" {
  type = map(string)
}
