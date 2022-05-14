# local modules with ec2 and apache2 example

two local modules are created ec2 and vpc both definitions  are present in modules folder

httpd.sh : has installation script of apache2 

east-region-key-pair is key pair name replace it with your key  it with your key ec2 module main.tf file and vars.tf
## steps

ssh-keygen -f east-region-key-pair 

terraform init

terraform plan -out terraform.out

terraform apply terraform.out



### NOTE : if key has a pass phrase then add it by using ssh-add. east-region-key-pair is key pair name replace it with your key pair.
 
