# HI This OCI Hub-Spoke Solution 
#             We will go with two main steps:
# (1) prepare our code with Terraform
# (2) Deploy our Code to OCI infra

#              let's begin with prepare our code with Terraform.

our main dir contain these files:
[1] variables.tf
[2] provider.tf
[3] spoke1.tf
[4] spoke2.tf
[5] main.tf
[6] hub.tf
[7] compute.tf
[8] datasources.tf
[9] outputs.tf 

Now regarding image attached to this project we will create our resources.

check every file and customize it like you want with your lab.



To Deply your code:
(1) Deploy Using Oracle Resource Manager
(2) Deploy Using the Terraform CLI
 In terraform machine you will need to clone your github repo to your machine or if 
 it actually in terraform machine just skip next step.

 Clone repo to your terraform machine:
 git clone https://github.com/your_path_to_repo
 cd your_path_to_repo

 Now check terraform.trvs file and modify it with your data.

 Next we will init our environment with new code

 terraform init

 Next we will plan to check from our code, you can save this plan to run it in another time

 terraform plan

 Last step and most important is to apply your code and start build your Infra.

 terraform apply
