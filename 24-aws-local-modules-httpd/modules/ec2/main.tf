resource "aws_instance" "arivu-httpd" {

    ami = "${lookup(var.AMI, var.AWS_REGION)}"
    instance_type = "t2.micro"

    # VPC
  subnet_id = "${var.subnet_id}"

    # Security Group
    vpc_security_group_ids = ["${var.sshbyall}"]

    # the Public SSH key
    key_name = "${aws_key_pair.east-region-key-pair.id}"

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

resource "aws_key_pair" "east-region-key-pair" {
    key_name = "east-region-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
