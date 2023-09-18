variable "env_name" {
  type= string
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "alb_target_group" {
  type = string
}
variable "vpc_security_group_ids_ssh" {
  type = string
}
variable "vpc_security_group_ids_http" {
  type = string
}
variable "subnet_id" {
  type=string
}

variable "subnet_id_2" {
  type=string
}
