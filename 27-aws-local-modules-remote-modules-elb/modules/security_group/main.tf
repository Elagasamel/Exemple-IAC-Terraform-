resource "aws_internet_gateway" "aws_arivu_gw" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "aws_arivu_gw"
  }
}

output "igw_id" {
value = "${aws_internet_gateway.aws_arivu_gw.id}"
}


resource "aws_security_group" "sg_aws_arivu" {
  name        = "instance_sg"
  description = "Used in the terraform"
  vpc_id = "${var.vpc_id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Our elb security group to access
# the ELB over HTTP
resource "aws_security_group" "elb_aws_arivu" {
  name        = "elb_sg"
  description = "Used in the terraform"

  vpc_id = "${var.vpc_id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ensure the VPC has an Internet gateway or this step will fail
  depends_on = [aws_internet_gateway.aws_arivu_gw]
}
output "sg_id" {
 value = "${aws_security_group.elb_aws_arivu.id}"

}

output "sg2_id" {
 value = "${aws_security_group.sg_aws_arivu.id}"

}
