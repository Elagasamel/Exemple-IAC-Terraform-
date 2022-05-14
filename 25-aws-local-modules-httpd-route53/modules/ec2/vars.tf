variable "AWS_REGION" {    
    default = "us-east-2"
}
variable "PRIVATE_KEY_PATH" {
  default = "arivu-httpd-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "arivu-httpd-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
    type = map(string)

    default =  {
    eu-west-2 = "ami-03dea29b0216a1e03"
    us-east-2 = "ami-00399ec92321828f5"
  }
}
variable "subnet_id" {}
variable "sshbyall" {}


