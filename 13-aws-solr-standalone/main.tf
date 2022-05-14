


# ec2 Instance

resource "aws_instance" "arviu-aws-solr" {
  ami                    = "${var.instance_ami}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${var.subnet_ids}"
  vpc_security_group_ids = ["${aws_security_group.arviu-aws-solr-sg.id}"]

  
  provisioner "file" {
    source      = "solr.sh"
    destination = "/tmp/solr.sh"
  }
  provisioner "file" {
    source      = "install_solr_service.sh"
    destination = "/tmp/install_solr_service.sh"
  }  

  provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/solr.sh",
            "/tmp/solr.sh"
        ]
    }
  tags = {
    Name = "arviu-aws-solr"
  }

    key_name = "${aws_key_pair.solr-key-pair.id}"

  connection {
      agent = true
      host = self.public_ip
      user = "${var.EC2_USER}"

  }
}

# Security Group

resource "aws_security_group" "arviu-aws-solr-sg" {
  name   = "arviu-aws-solr-sg"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8983
    to_port     = 8983
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
    Name = "arviu-aws-solr-sg"
  }
}

# Elastic IP

resource "aws_eip" "arivu-aws-solr-eip" {
  instance = aws_instance.arviu-aws-solr.id
  vpc      = true
}



resource "aws_key_pair" "solr-key-pair" {
    key_name = "solr-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
