output "alb_target_group" {
 value=aws_lb_target_group.test.arn 
}
output "vpc_security_group_ids_http" {
  value = aws_security_group.my_public_sg.id
}
output "vpc_security_group_ids_ssh" {
  value = aws_security_group.ssh.id
}