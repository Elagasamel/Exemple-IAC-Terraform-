resource "aws_instance" "arivu-httpd-route53" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
  subnet_id = "${var.subnet_id}"

    # Security Group
    vpc_security_group_ids = ["${var.sshbyall}"]

    # the Public SSH key
    key_name = "${aws_key_pair.arivu-httpd-key-pair.id}"

    # nginx installation
    provisioner "file" {
        source = "httpd.sh"
        destination = "/tmp/httpd.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/httpd.sh",
            "sudo /tmp/httpd.sh"
        ]
    }

    connection {
        agent = true
        host = self.public_ip
        user = "${var.EC2_USER}"
    }
}

resource "aws_key_pair" "arivu-httpd-key-pair" {
    key_name = "arivu-httpd-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}


resource "aws_eip" "arivu-aws-eip" {
  instance = aws_instance.arivu-httpd-route53.id
  vpc      = true
}

output "arivu-aws-eip_id" {
  value = aws_eip.arivu-aws-eip.id
}

output "public_ip" {
  value = aws_eip.arivu-aws-eip.public_ip
}