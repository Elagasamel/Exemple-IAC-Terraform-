# mongodb replicaset

3 ec2 instance one primary  and 2 secondary mongo instances

## steps :

create a key-pair for primary : ssh-keygen -f mongodb-key-pair

create a key-pair for secondary  : ssh-keygen -f mongodb-key-pair-sec

create a key-pair for secondary 2 : ssh-keygen -f mongodb-key-pair-sec-2




terraform init

terraform plan -out terraform.out

terraform apply terraform.out
