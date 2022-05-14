variable "AWS_REGION" {    
    default = "us-east-2"
}

variable "AMI" {
    type = map(string)

    default =  {
    eu-west-2 = "ami-03dea29b0216a1e03"
    us-east-2 = "ami-00399ec92321828f5"
  }
}
