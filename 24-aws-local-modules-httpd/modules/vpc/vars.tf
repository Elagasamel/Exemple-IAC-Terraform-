variable "AWS_REGION" {    
    default = "us-east-2"
}
variable "aws-vpc-cidr" {
  type = string
}
variable "aws-subnet-cidr" {
  type = string
}

variable "vpc_id" {}
