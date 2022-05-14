resource "aws_instance" "web" {
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${lookup(var.AMI, var.AWS_REGION)}"

  
  key_name = "${aws_key_pair.awsregion-key-pair.id}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${var.sg2_id}"]
  subnet_id              = "${var.subnet_id}"
  user_data              = file("userdata.sh")

  #Instance tags

  tags = {
    Name = "elb-example"
  }
}


output "ec2_id" {
 value = "${aws_instance.web.id}"   

}


resource "aws_key_pair" "awsregion-key-pair" {
    key_name = "awsregion-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
