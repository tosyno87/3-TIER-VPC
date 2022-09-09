provider "aws" {
region = "us-east-2"
}

module "vpc" {
source = "terraform-aws-modules/vpc/aws"
name = "test-vpc"
cidr = "10.0.0.0/16"

azs             = ["us-east-2a", "us-east-2b"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24"]

enable_ipv6 = true
enable_nat_gateway = false
single_nat_gateway = true
public_subnet_tags = {
Name = "Public-Subnets"
}
tags = {
Owner       = "user"
Environment = "dev"
}
vpc_tags = {
Name = "W17VPC"
}
}

 #Create an Network Load Balancer
resource "aws_lb" "NLB17" {
name = "NLB17"
internal = false
load_balancer_type = "network"
subnets = ["subnet-043034af59f9adc8f", "subnet-0f661d0634d0477c6"]
enable_deletion_protection = false #true if you are not planning on destroying your load balancer
}