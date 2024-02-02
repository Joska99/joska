output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

# Subnets
output "public_sub_cidr" {
  value = aws_subnet.subnets["public_sub"].cidr_block
}
output "public_sub_id" {
  value = aws_subnet.subnets["public_sub"].id
}
output "private_sub_cidr" {
  value = aws_subnet.subnets["private_sub"].cidr_block
}
output "private_sub_id" {
  value = aws_subnet.subnets["private_sub"].id
}

# Route tables
output "public_rt" {
  value = aws_default_route_table.public_rt.route
}
output "private_rt" {
  value = aws_route_table.private_rt.route
}

# NAT
output "nat_id" {
  value = aws_nat_gateway.pub_nat.id
}
output "nat_pip" {
  value = aws_nat_gateway.pub_nat.public_ip
}
