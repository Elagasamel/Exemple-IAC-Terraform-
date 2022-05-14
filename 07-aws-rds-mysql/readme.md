# RDS example

RDS is AWS’s service for  Relational Databases.

It manage the hardware, the server installation, setup, and other administrative tasks such as version upgrades and backups.

## step 1:
 
 terraform init
 
 (to initialize the configuration files)
 
 ## step 2:
 
 terraform plan -out output.tf --var-file="variables.tfvars"
 
 -var-file="variables.tfvars" : "variables.tfvars" contains input variable definitions 
 
 this way we can pass variable inputs through  the file at  run time 
 
  ## step 3:

 terraform apply -out "output.tf"
 
 
## for cleanup

terraform destroy


