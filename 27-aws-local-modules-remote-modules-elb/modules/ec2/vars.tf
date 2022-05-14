variable ec2_id {}
variable "AMI" {
    type = map(string)

    default =  {
    eu-west-2 = "ami-03dea29b0216a1e03"
    us-east-2 = "ami-00399ec92321828f5"
  }
}
variable "subnet_id" {}


variable "AWS_REGION" {    
    default = "us-east-2"
}
variable "PRIVATE_KEY_PATH" {
  default = "awsregion-key-pair"
}


variable "PUBLIC_KEY_PATH" {
  default = "awsregion-key-pair.pub"
}

variable sg2_id {}
