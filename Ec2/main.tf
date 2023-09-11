# resource "aws_key_pair" "example" {
#   key_name   = "id_rsa"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCZSavdSQ2mMVWFsQfc5EmiXH8TY+DIF7Z79ZST/nbN/cEE5yWJuv7cDGMdWeNeYacn3whLvuWA7GHg52ocoDdyP11Zr5SIvKTO8R6BXfiszpb+Vni14dAE4N/3GlXC4szklMN4CyKWKUf/xKrtB6Cv8gdeH73ZvX5dA8Q3PSWgMXtlbBJHcHA90EKFK7M5n5t7bXaWZ1nyb8mELfgs0khZX1NRwnzefsX/jpCM2kmzSTm8kRMlnNRtj8m3vwRTmBasfGbngWdjm9mQX+kLQGJIHJGsL1sM6J4zg1jlh4xsM9uT5C3ls2B82ZA8/sGGAu/CHVsM5UotPecyWOja8SLz alihu@LAPTOP-0HDO1CJI"
# }

resource "aws_instance" "web" {
  count=2
  ami           = var.ami_id
  instance_type = var.instance_type
  # vpc_id = var.vpc_id
  subnet_id     = var.subnet_id
  vpc_security_group_ids  = [ aws_security_group.ssh.id, aws_security_group.my_public_sg.id]
   key_name      = "bastionhost"
  tags = {
    Name = var.env_name
  }
  user_data     =  "${file("install_apache.sh")}"
}
# resource "null_resource" "copy_execute" {
  
#     connection {
#     type = "ssh"
#     host = aws_instance.web.public_ip
#     user = "ec2-user"
#     private_key = file("bastionhost.pem")
#     }

 
#   # provisioner "file" {
#   #   source      = "httpd.sh"
#   #   destination = "/tmp/httpd.sh"
#   # }
  
#    provisioner "remote-exec" {
#    inline = [
#       "touch hello.txt",
#       "echo helloworld remote provisioner >> hello.txt",
#       "sudo dnf update -y",
#       "sudo dnf install -y httpd php php-mysqli mariadb105",
#       "sudo systemctl start httpd",
#       "sudo systemctl enable httpd"
#     ]
#   }
  
#   depends_on = [ aws_instance.web ]
  
#   }
