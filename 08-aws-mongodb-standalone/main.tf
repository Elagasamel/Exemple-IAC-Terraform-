

# Instance primary


resource "aws_instance" "arviu-aws-mongo" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_ids}"
  vpc_security_group_ids = ["${aws_security_group.arviu-aws-mongo-sg.id}"]

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
    Name = "arviu-aws-mongo"
  }

    key_name = "${aws_key_pair.mongodb-key-pair.id}"

  connection {
      agent = true
      host = self.public_ip
      user = "${var.EC2_USER}"

  }
}

# Security Group primary


resource "aws_security_group" "arviu-aws-mongo-sg" {
  name   = "arviu-aws-mongo-sg"
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
    Name = "arviu-aws-mongo-sg"
  }
}

# Elastic IP primary 


resource "aws_eip" "arivu-aws-mongo-eip" {
  instance = aws_instance.arviu-aws-mongo.id
  vpc      = true
}

# key pair primary 


resource "aws_key_pair" "mongodb-key-pair" {
    key_name = "mongodb-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
