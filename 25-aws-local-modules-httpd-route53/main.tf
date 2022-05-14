module "arivu_aws_vpc" {
   source = "./modules/vpc"
   aws-vpc-cidr = var.aws-vpc-cidr
   aws-subnet-cidr = var.aws-subnet-cidr
   vpc_id      = "${module.arivu_aws_vpc.vpc_id}"  
}

module "arivu_aws_ec2" {
  source = "./modules/ec2"
  subnet_id     = module.arivu_aws_vpc.subnet_id
  sshbyall = module.arivu_aws_vpc.sshbyall

}


module "arivu_aws_route53" {
  source = "./modules/route-53"
  public_ip     = module.arivu_aws_ec2.public_ip
  
}