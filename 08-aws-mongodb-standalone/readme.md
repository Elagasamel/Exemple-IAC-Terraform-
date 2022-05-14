# MongoDB standalone 

single ec2 instance is created with mongodb installed.

## file description 

1 . Mongod.sh : installation script of mongo

2. mongod.conf : configuration file of mongodb

## steps.
### create a key-pair : ssh-keygen -f mongodb-key-pair


NOTE : mongodb-key-pair is key pair name replace it with your key it with your key ec2 module main.tf file and vars.tf


NOTE : if key has a pass phrase then add it by using ssh-add. mongodb-key-pair is key pair name replace it with your key pair.


terraform init

terraform plan -out terraform.out

terraform apply terraform.out

