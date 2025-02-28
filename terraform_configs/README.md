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

# Deployment details

## Application configured with Application Load Balancer

![Terrafrom-Deploy-ALB](../images/terraform-deploy.png)

## Configured to backend and logged in with backend

![Terrafrom-Backend](../images/terraform-deploy-2.png)

## Configured to database and retreiveing data from database

![Terrafrom-Backend-Database](../images/terraform-deploy-3.png)

