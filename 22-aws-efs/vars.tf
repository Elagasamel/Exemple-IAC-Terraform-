
variable "region" {
  description = "The AWS region to create things in"
  default     = "us-east-2"
}


variable "instance_ami" {
  description = "ubuntu"
  default     = "ami-00399ec92321828f5"

}



variable "instance_type" {
  description = "Instance AWS type"
  default     = "t2.micro"
}


variable "PRIVATE_KEY_PATH" {
  default = "efs-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "efs-key-pair.pub"
}


variable "vpc_id" {
  default     = "vpc-069dd3f23d5ca1b76"
}

variable "subnet_ids" {
  default = "subnet-0027a5c84d51ac332"
}


variable "cidr_blocks" {
  default     = "0.0.0.0/0"
  description = "CIDR for sg"
}



## user name
variable "EC2_USER" {
  default = "ubuntu"
}
