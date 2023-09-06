resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.tag_name
}
resource "aws_subnet" "my_public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/26"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags                    = var.tag_name
}
resource "aws_subnet" "my_private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.64/26"
  availability_zone = var.availability_zone
  tags              = var.tag_name
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.tag_name
}
# resource "aws_internet_gateway_attachment" "my_igw_attachment" {
#   internet_gateway_id = aws_internet_gateway.my_igw.id
#   vpc_id              = aws_vpc.my_vpc.id
# }

resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.tag_name
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

}

resource "aws_route_table_association" "pub_subnet_association" {

  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.publicrt.id
}
