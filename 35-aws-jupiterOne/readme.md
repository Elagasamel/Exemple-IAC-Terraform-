# JupiterOne Integration with aws


## Steps done on jupiterOne 


1) create account on https://jupiterone.com/  

2) For Intergating Aws : Go setting option and select Intregation

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-integration.jpg)

3) In intergration page select aws 

4) click on Add the configuration.

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/add-configuration.jpeg)

5) Here you will get the AccountID and external ID

COPY those for future use in terraform script.

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/J1-6-Integration-AWS-Terraform.jpg)


## Terraform Edits


1) Edit main.tf file replace "extId:" with external ID and "acctID:" with AccountID

save the main.tf.

2) terraform init 


3) terraform plan -out output.tf


4) terraform apply output.tf

Here You will create the IAM role for  acessing aws resources by JupiterOne

The output of the result will have arn of the role COPY that for future use.


## JupiterOne ADD configuration 


1) Give the Name to the configuration 

2) Paste the role arn we have copied from the output of terraform.

3) save the configuration

## JupiterOne ADD Dashboard.

## Import prebuilt Insights Dashboards

1) Navigate within JupiterOne to Apps -> Insights to add a board

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j1-insight.png)


2) Expand the left sidebar by hitting the > carrot


3) Hit the Add button + choose whether you want a personal or team board



4) select from available dashboard or add your json.
  
![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/dashboard-pick.jpeg)
  
  
5) For example selected  the aws-resource dashboard.

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/aws-resource.jpeg)



6) For fetching the latest update run the integration 

  go to Integration > aws > aws-demo > setting-page


   click on play button of  configuration setting page
   
   
   
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/run-integration-0.jpeg)

    
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/run-play-int.jpeg)

  
  
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/run-integration.jpeg)
  
  
  
 7) Once Integration run is done run job status will be updated 

  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/jobststatus.png)



8) check the dashboard for the latest fetch 


s3 dashboard

  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/d1.png)

aws resource dashboard

  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/d2.png)
  
  lambda 

  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/d3.png)



9) Run the J1 query to find the particular resource in query anywhere section.

  status bar:
  
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j1.png)

  
  
  search s3 records
  
  query: 
  
  1) Find aws_s3_bucket with secureTransport != true as bucket


  2) Find aws_s3_bucket with encrypted != true as bucket

  
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j2.png)
  
  
  
  3) search s3 blockpublicacl not true
  
  query:
  
  Find aws_s3_bucket with blockPublicAcls != true as bucket
  
  
  ![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j3.png)






 4) Complex queries:
 
 query: FIND AccessKey WITH usage='ssh'


![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j4.png)




query : FIND Firewall AS fw
    THAT ALLOWS AS rule (Network|Host) AS n
WHERE
    rule.ingress=true AND rule.fromPort=22
RETURN
    fw._type, fw.displayName

![MS](https://raw.githubusercontent.com/MetaArivu/terraform-quickstart/main/images/j5.png)














