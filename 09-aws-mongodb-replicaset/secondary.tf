

# Instance secondary-2

resource "aws_instance" "arviu-aws-mongo-secondary-2" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_ids}"
  vpc_security_group_ids = ["${aws_security_group.arviu-aws-mongo-sg-sec-2.id}"]

  provisioner "file" {
    source      = "mongod.conf"
    destination = "/tmp/mongod.conf"
  }
  provisioner "file" {
    source      = "mongod.sh"
    destination = "/tmp/mongod.sh"
  }

  provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/mongod.sh",
            "/tmp/mongod.sh"
        ]
    }
  tags = {
    Name = "arviu-aws-mongo-secondary-2"
  }

    key_name = "${aws_key_pair.mongodb-key-pair-seconday-2.id}"

  connection {
      agent = true
      host = self.public_ip
      user = "${var.EC2_USER}"

  }
}

# Security Group secondary-2

resource "aws_security_group" "arviu-aws-mongo-sg-sec-2" {
  name   = "arviu-aws-mongo-sg-sec-2"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "arviu-aws-mongo-sg-sec-2"
  }
}

# Elastic IP secondary -1

resource "aws_eip" "arivu-aws-mongo-sec-eip-2" {
  instance = aws_instance.arviu-aws-mongo-secondary-2.id
  vpc      = true
}



resource "aws_key_pair" "mongodb-key-pair-seconday-2" {
    key_name = "mongodb-key-pair-sec-2"
    public_key = "${file(var.PUBLIC_KEY_PATH_SEC_2)}"
}
