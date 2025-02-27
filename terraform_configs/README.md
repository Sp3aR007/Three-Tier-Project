This contains Terrafrom configurations to deploy and manage AWS infrastructure as code. This is a three tier application which has a application load balancer, frontend instances in public subnet, backend and database instances in private subnet.

# AWS configuration [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## Enter the AWS credentials
```
aws configure
```

# Terraform cnfiguration

## Intialise the terraform
```
terraform init
```

## Create an execution plan
```
terraform plan
```

## Apply the configuration 
```
terraform apply 
```

## Destroying resources
```
terraform destroy
```