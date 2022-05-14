resource "aws_instance" "arivu-EC2-dev" {
    ami = var.amidev
    instance_type = "t2.micro"
    tags = {
        Name = "arivu-EC2-dev"
    }
}
resource "aws_instance" "arivu-EC2-prod" {
    ami = var.ami
    instance_type = "t2.micro"
    tags = {
        Name = "arivu-EC2-prod"
    }
   provider = aws.prod
}

