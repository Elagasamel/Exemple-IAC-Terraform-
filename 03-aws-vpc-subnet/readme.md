# aws-vpc-subnet


creating vpc and subnet using terraform

for vpc we are using same resource  definition  from the previous example

subnet definition is added into it.

## tf file description 


main.tf : contains the vpc and subnet resource  definition 

provider.tf : cloud provider data 

vars.tf : variable declaration file

## steps to create

## step 1
terraform init 

(initialize the working directory containing Terraform configuration files)

## step 2

terraform plan -out output.tf 

(creates an execution plan "-out" is optinal tag used to save plan in a file output.tf)

## step 3

terraform apply "output.tf"

(execute the plan) 

# for clean up 

terraform destroy
