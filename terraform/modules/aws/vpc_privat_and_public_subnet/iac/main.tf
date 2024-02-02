# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.aws_vpc.ip_cidr

  tags = {
    Name = var.aws_vpc.name
  }
}

# Create internet Gate Way
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}

# Create Public and Private Subnets
resource "aws_subnet" "subnets" {
  # Iterates on "map{Object}"
  for_each = var.aws_subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.ip_cidr
  map_public_ip_on_launch = each.value.public_ip

  tags = {
    Name = each.key
  }
}

# Add routing ot IGW to default routing table 
resource "aws_default_route_table" "public_rt" {
  depends_on             = [aws_vpc.vpc]
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "public-rt-tf"
  }
}

# Create EIP for NAT
resource "aws_eip" "elastic_ip" {}

# Create NAT for private subnet
resource "aws_nat_gateway" "pub_nat" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.subnets["public_sub"].id

  tags = {
    Name = var.nat_gw_name
  }
}

# Create routing table for private sunet
resource "aws_route_table" "private_rt" {
  depends_on = [aws_vpc.vpc]
  vpc_id     = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.pub_nat.id
  }

  tags = {
    Name = "private-rt-tf"
  }
}

# Assosiate private subntet with routing table
resource "aws_route_table_association" "associate_private_rt" {
  depends_on     = [aws_subnet.subnets]
  subnet_id      = aws_subnet.subnets["private_sub"].id
  route_table_id = aws_route_table.private_rt.id
}
