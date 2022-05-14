# local and remote modules examples

## remote modules :

vpc modules soucre is remote  https://github.com/MetaArivu/terraform-modules/modules/vpc 

# local modules
ec2,rt,security group and elb  are defined locally under modules folder


awsregion-key-pair is key pair name replace it with your key ec2 module main.tf file and vars.tf
## steps

ssh-keygen -f awsregion-key-pair 

terraform init

terraform plan -out terraform.out

terraform apply terraform.out



### NOTE : if key has a pass phrase then add it by using ssh-add. awsregion-key-pair is key pair name replace it with your key pair.

key path variable has to modified as your requirements 
