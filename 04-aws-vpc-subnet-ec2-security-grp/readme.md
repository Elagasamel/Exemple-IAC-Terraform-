# aws-vpc-subnet


creating vpc, subnet. ec2 instance, secuirty group, igw etc   using terraform in aws 

for vpc and subnet  we are using same resource  definitions  from the previous examples

other resources  definition are added into it.

## tf file description 


vpc-subnet.tf : contains the vpc and subnet resource  definition 

igw-sg.tf : internet gateway, route table and security  groups  resources  definition 

main.tf : ec2 instance  resource  definition 

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
