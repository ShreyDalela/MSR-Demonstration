# MSR Test
The repository contains all resources for MSRCOSMOS test following is the folder structure mapped with the questions

    .
    ├── AWSDeployment.ps1
    ├── MSR_PackageDeployment.yml
    ├── webserver_container.yml
    ├── couchdb_container.yml
    ├── dockercompose                    
    │   ├── webapp                          
    |   |   ├── index.html
    |   |   ├── dockerfile 
    |   |   └── docker-compose.yml
    │   ├── DB             
    |   |   └── docker-compose.yml
    └── ...


### Q1
---
>	Create two EC2 Instances in AWS Cloud using,
>    Additional Information
>    *	Instance Type of both instance is t2.micro
>    *	Operating System for both instances Ubuntu Server 16.04 LTS
>    *	Hostname of Instance 1 : MSR-test-Instance-1
>    *	Hostname of Instance 2 : MSR-test-Instance-2
>

### Solution:
>For deploying the machines on AWS platform, the repository contains **_AWS_Deployment.ps1_** powershell file that deploys the 2 machines >it requires accesskey and sectret key as input parameters alonw with AWSPowershell Module that caters all its commands.
>
>The flow of execution of the powershell script is as follows
>
>1. User inputs AccessKey and Secretkey which is stored as profile named MSRProfile that is being used all over the script
>2. A new key pair is generated for scripts further  flow
>3. Security group is created for the machines
>4. MSR-test-Instance-1 gets deployed, moves to the security group specified earlier and its hostname is updated
>5. MSR-test-Instance-2 gets deployed, moves to the security group specified earlier and its hostname is updated




### Q2
---
> Once these two servers are provisioned, ensure the below following software packages are installed using configuration >management tool in both the provisioned instances.
>   Additional Information
>    *	NVM – Version 0.33.2
>    *	Node=8.12.0
>    *	Docker – 18.06 or latest
>    *	Docker Compose – 1.13 or latest
>    *	Openssl – latest version
>    *	Git – latest version
>
### Solution:
>For deploying the packages mentioned, ansible was the choice for the configuration management tool. all the pre-requisites for ansible >were fulfilled manually and an ansible playbook named **_MSR_PackageDeployment.yml_** achieves the task of installing these packages. >The flow of execution is controlled in the playbook itself




### Q3
---
>Create a Docker Container in MSR-test-Instance-1 using Docker Compose file and ensure apache webserver is installed. Try to use >configuration management tools to automate the entire installation of apache and deploy a sample html file from a GitHub repository.
>     Additional Information
>     *	You can create your own GitHub repository with a sample html file.

### Solution:
>For deploying the docker container using docker-compose, ansible was the choice for the configuration management tool.
>An ansible playbook named **_webserver_container.yml_** achieves the task of deploying the container with Apache installed and the index.html is fetched from the same git reposities.  

    .
    ├── webserver_container.yml
    ├── dockercompose                    
    │   ├── webapp                        # Files for Apache Deployment    
    |   |   ├── index.html
    |   |   ├── dockerfile 
    |   |   └── docker-compose.yml
    └── ...



### Q4
---
>Create a Docker Container in MSR-test-Instance-2 using Docker Compose file and ensure CouchDB Database is installed. Try to use any >configuration management tool to automate the entire installation processes.
>    Additional Information
>    *	We should be able to access the Futon – web GUI of CouchDB, from the external system.

### Solution:
>For deploying the docker container using docker-compose, ansible was the choice for the configuration management tool.
>An ansible playbook named **_couchdb_container.yml_** achieves the task of deploying the container with couchdb. 
>The flow of execution is controlled in the playbook itself

    .
    ├── couchdb_container.yml
    ├── dockercompose                  
    │   ├── DB                           # Files for CouchDB Deployment               
    |   |   └── docker-compose.yml
    └── ...
