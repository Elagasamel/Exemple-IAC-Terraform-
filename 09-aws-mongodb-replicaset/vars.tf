# Region

variable "region" {
  description = "The AWS region to create things in"
  default     = "us-east-2"
}




# Ubuntu 16.04 LTS

variable "instance_ami" {
  description = "ubuntu"
  default     = "ami-00399ec92321828f5"

}



variable "instance_type" {
  description = "Instance AWS type"
  default     = "t2.micro"
}



# Key Pair Name
variable "PRIVATE_KEY_PATH" {
  default = "mongodb-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "mongodb-key-pair.pub"
}



variable "PUBLIC_KEY_PATH_SEC" {
  default = "mongodb-key-pair-sec.pub"
}

variable "PUBLIC_KEY_PATH_SEC_2" {
  default = "mongodb-key-pair-sec-2.pub"
}


variable "vpc_id" {
  description = "Mongo VPC"
  default     = "vpc-069dd3f23d5ca1b76"
}

# Subnet
variable "subnet_ids" {
  default = "subnet-0027a5c84d51ac332"
}

# Security Group

variable "cidr_blocks" {
  default     = "0.0.0.0/0"
  description = "CIDR for sg"
}


## user name
variable "EC2_USER" {
  default = "ubuntu"
}
