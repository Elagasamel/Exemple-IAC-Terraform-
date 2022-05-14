resource "aws_vpc" "arivu-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" 
    enable_dns_hostnames = "true" 
    enable_classiclink = "false"
    instance_tenancy = "default"    
    tags = {
        Name = "arivu-vpc"
}
}

resource "aws_subnet" "arivu-subnet-public-3" {
    vpc_id = "${aws_vpc.arivu-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-2a"
    tags = {
        Name = "arivu-subnet-public-3"
    }
}
