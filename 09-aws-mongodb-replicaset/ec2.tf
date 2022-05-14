

# Instance secondary-1

resource "aws_instance" "arviu-aws-mongo-secondary" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_ids}"
  vpc_security_group_ids = ["${aws_security_group.arviu-aws-mongo-sg-sec.id}"]

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
    Name = "arviu-aws-mongo-secondary"
  }

    key_name = "${aws_key_pair.mongodb-key-pair-seconday.id}"

  connection {
      agent = true
      host = self.public_ip
      user = "${var.EC2_USER}"

  }
}

# Security Group secondary-1

resource "aws_security_group" "arviu-aws-mongo-sg-sec" {
  name   = "arviu-aws-mongo-sg-sec"
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
    Name = "arviu-aws-mongo-sg-sec"
  }
}

# Elastic IP secondary -1

resource "aws_eip" "arivu-aws-mongo-sec-eip" {
  instance = aws_instance.arviu-aws-mongo-secondary.id
  vpc      = true
}



resource "aws_key_pair" "mongodb-key-pair-seconday" {
    key_name = "mongodb-key-pair-sec"
    public_key = "${file(var.PUBLIC_KEY_PATH_SEC)}"
}
