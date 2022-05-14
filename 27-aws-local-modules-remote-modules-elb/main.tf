provider "aws" {
    region = "us-east-2"
}
module "arivu-aws-vpc" {
  source      = "github.com/MetaArivu/terraform-modules/modules/vpc"
  //awsvpc_cidr = "192.168.0.0/16"
  arivu_aws_vpc_cidr = "10.0.0.0/16"
  vpc_id      = "${module.arivu-aws-vpc.vpc_id}"
  //aws_subnet_cidr = "10.0.1.0/24"
  arivu_aws_subnet_cidr = "10.0.1.0/24"
  subnet_id = "${module.arivu-aws-vpc.subnet_id}"
}

module "rt" {
  source = "./modules/rt"
  vpc_id = "${module.arivu-aws-vpc.vpc_id}"
  subnet_id = "${module.arivu-aws-vpc.subnet_id}"
  igw_id = "${module.sg.igw_id}" 
}

module "sg" {
  source = "./modules/security_group"
  vpc_id = "${module.arivu-aws-vpc.vpc_id}"
  sg_id = "${module.sg.sg_id}"
  sg2_id = "${module.sg.sg_id}"
  igw_id = "${module.sg.igw_id}" 


}

module "elb" {
  source = "./modules/elb"
  subnet_id = "${module.arivu-aws-vpc.subnet_id}"
  ec2_id = "${module.ec2.ec2_id}"
  sg_id = "${module.sg.sg_id}"

}


module "ec2" {
  source = "./modules/ec2"
  subnet_id = "${module.arivu-aws-vpc.subnet_id}"
  sg2_id = "${module.sg.sg2_id}"
  ec2_id = "${module.ec2.ec2_id}"

}
