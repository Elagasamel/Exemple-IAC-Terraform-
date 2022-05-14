resource "aws_vpc" "arivu-aws-vpc-prod" {
    cidr_block = "${var.aws-vpc-cidr}"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    tags = {
        Name = "arivu-aws-vpc-prod"
}
}

resource "aws_subnet" "arivu-aws-subnet-public-prod" {
    vpc_id = "${aws_vpc.arivu-aws-vpc-prod.id}"
    //cidr_block = "10.0.1.0/24"
    cidr_block = "${var.aws-subnet-cidr}"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags = {
        Name = "arivu-aws-subnet-public-prod"
    }
}
# create an IGW (Internet Gateway)
# It enables your vpc to connect to the internet
resource "aws_internet_gateway" "arivu-igw" {
    vpc_id = "${aws_vpc.arivu-aws-vpc-prod.id}"

    tags = {
        Name = "arivu-igw"
    }
}

# create a custom route table for public subnets
# public subnets can reach to the internet buy using this
resource "aws_route_table" "arivu-aws-public-crt" {
    vpc_id = "${aws_vpc.arivu-aws-vpc-prod.id}"
    route {
        cidr_block = "0.0.0.0/0" //associated subnet can reach everywhere
        gateway_id = "${aws_internet_gateway.arivu-igw.id}" //CRT uses this IGW to reach internet
    }

    tags = {
        Name = "arivu-aws-public-crt"
    }
}

# route table association for the public subnets
resource "aws_route_table_association" "aws-public-subnet-arivu" {
    subnet_id = "${aws_subnet.arivu-aws-subnet-public-prod.id}"
    route_table_id = "${aws_route_table.arivu-aws-public-crt.id}"
}

# security group
resource "aws_security_group" "sshbyall" {

    vpc_id = "${aws_vpc.arivu-aws-vpc-prod.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        
        // This means, all ip address are allowed to ssh !
        // Do not do it in the production. Put your office or home address in it!
        cidr_blocks = ["0.0.0.0/0"]
    }

    //If you do not add this rule, you can not reach the NGIX
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "sshbyall"
    }
}


output "vpc_id" {
  value = aws_vpc.arivu-aws-vpc-prod.id
}

output "subnet_id" {

value = aws_subnet.arivu-aws-subnet-public-prod.id
}
output "sshbyall" {
 value = aws_security_group.sshbyall.id
}
