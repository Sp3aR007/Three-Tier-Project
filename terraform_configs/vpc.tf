# VPC Configuration
resource "aws_vpc" "application" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  
  tags = {
    Name = "Main VPC"
  }
}


