


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
    source      = "replica.js"
    destination = "/tmp/replica.js"
  }
  provisioner "file" {
    source      = "mongod-master.sh"
    destination = "/tmp/mongod-master.sh"
  }
  provisioner "file" {
    source      = "replica.sh"
    destination = "/tmp/replica.sh"
  }
  provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/mongod-master.sh",
            "/tmp/mongod-master.sh"
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



resource "aws_eip" "arivu-aws-mongo-eip" {
  instance = aws_instance.arviu-aws-mongo.id
  vpc      = true
}



resource "aws_key_pair" "mongodb-key-pair" {
    key_name = "mongodb-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}


resource "aws_route53_zone" "private" {
  name = "arivu.in"

  vpc {
     vpc_id = "${var.vpc_id}"
  }
}

resource "aws_route53_record" "arivu-route-53-record-1" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "node1.arivu.in"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.arviu-aws-mongo.private_ip]
}

resource "aws_route53_record" "arivu-route-53-record-2" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "node2.arivu.in"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.arviu-aws-mongo-secondary.private_ip]
}

resource "aws_route53_record" "arivu-route-53-record-3" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "node3.arivu.in"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.arviu-aws-mongo-secondary-2.private_ip]
}

resource "null_resource" "arviu-aws-mongo" {
  connection {
    host = aws_instance.arviu-aws-mongo.public_ip
    agent = true
    user = "${var.EC2_USER}"
  }

  provisioner "remote-exec" {
     inline = [
            "chmod +x /tmp/replica.sh",
            "/tmp/replica.sh"
]      
    
  }
    depends_on = [aws_instance.arviu-aws-mongo, aws_route53_record.arivu-route-53-record-1, aws_route53_record.arivu-route-53-record-2, aws_route53_record.arivu-route-53-record-3]

}
