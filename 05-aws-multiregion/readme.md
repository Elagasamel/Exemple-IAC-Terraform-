# multiregion ec2 

This example is to demonstrate how to multiple ec2 instances  in different  regions in one go using terraform 

## tf files description 

main.tf : two simple aws_instance resource definitions which wil be creating 2 different regions 

provider.tf : contains  the aws provider region data as previous  data with additional  parameter  "alias" added to the definition  for recognition of region.


vars.tf : variable declared


## changes in provider.tf :

  alias = "prod" is add in the one of the provider 
  
  this parameter  will be used in main.tf file to identify  the region.
  
## changes in aws_instance definition  :

   provider = aws.prod is added to the one aws_instance resource  definition 
   
   
 ## steps
 
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

 
   
   
   


  
  
  

 












