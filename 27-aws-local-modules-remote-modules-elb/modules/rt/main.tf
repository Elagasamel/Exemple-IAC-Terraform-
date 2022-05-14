resource "aws_route_table" "ariu_aws_rt" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }

  tags = {
    Name = "ariu_aws_rt"
  }
}

resource "aws_route_table_association" "ariu_aws_route_table_association" {
  subnet_id      = "${var.subnet_id}"
  route_table_id = aws_route_table.ariu_aws_rt.id
}
